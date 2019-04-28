//
//  MainViewModel.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MainViewModel {

    var mainView: MainView!
    let talker = AVSpeechSynthesizer()
    var timer: Timer?

    init(_ mainView: MainView) {
        self.mainView = mainView
    }

    //現在時刻について
    func startTimer() {
        //FIX ME
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(MainViewModel.updateTime), userInfo: nil, repeats: true)
        //Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(MainViewModel.updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        Notification.post("MainViewModel.updateTime", userInfo: ["Date": Date()])
    }

    func initEvent() {
        //60秒毎に分を更新するイベント
        Notification.onMainThread(self, name: "MainViewModel.updateTime") { notification in
            guard let date = (notification as NSNotification).userInfo?["Date"] as? Date else {
                return
            }
            //一秒ごとに画面を更新
            self.mainView.bind(date)
            
            //設定されている時間をとりだす
            guard let reservedDate = Defaults[.notifiedTime] else {
                return
            }
            
            let f = DateFormatter()
            f.timeStyle = .full
            f.dateStyle = .full
            f.locale = Locale(identifier: "ja_JP")
            print("//////f.string(from: reservedDate////////",f.string(from: reservedDate))
            print("Date(timeIntervalSinceNow: 0)",f.string(from: Date(timeIntervalSinceNow: 18)))
            
            //今の時間から設定されている時間を引く
            guard let elapsedMinute = Calendar.current.dateComponents([.hour], from: reservedDate, to: Date()).hour else {
                return
            }
            print("elapsedMinute",elapsedMinute)
            //1時間以上経過しているのであれば
            //24時間以上経過しているのであれば
            if elapsedMinute > 1 {
                //設定されていた時間に今の時間を加える
                Defaults[.notifiedTime] =  Date()
                //Siriに声をあげさせる
                self.speakSiri()
            }
            
        }

        //照度センサーを監視するイベント
        NotificationCenter.default.addObserver(self,
                                               selector: Selector("proximityChanged"),
                                               name:UIDevice.proximityStateDidChangeNotification,
                                               object: nil)
    }
    
    func updateLabel(){
        self.mainView.bindDescription(Defaults[.count])
    }

    @objc func updateTimer() {
        self.speakSiri()
    }
    
    @objc func proximityChanged() {
        Defaults[.count] += 1
        self.mainView.bindDescription(Defaults[.count])
        //センサーが二回反応してしまうため2の余剰をとっている
        if Defaults[.count] % 2 == 0 {
            self.speakSiri()
        }
    }
    

    func speakSiri(){
        let now = Date()

        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")

        let string = formatter.string(from: now)
        let utterance = AVSpeechUtterance(string: "本日は\(string)です")
        let utterance1 = AVSpeechUtterance(string: "本日開かれた回数は\(Defaults[.count]/2)回です")
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        self.talker.speak(utterance)
        self.talker.speak(utterance1)
    }
}
