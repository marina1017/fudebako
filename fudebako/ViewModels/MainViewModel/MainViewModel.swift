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

@available(iOS 10.0, *)
class MainViewModel {

    var mainView: MainView!
    let talker = AVSpeechSynthesizer()
    var timer: Timer?

    init(_ mainView: MainView) {
        self.mainView = mainView
    }

    //現在時刻について
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(MainViewModel.updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        Notification.post("MainViewModel.updateTime", userInfo: ["Date": Date()])
    }

    @available(iOS 10.0, *)
    func initEvent() {
        //60秒毎に分を更新するイベント
        Notification.onMainThread(self, name: "MainViewModel.updateTime") { notification in
            guard let date = (notification as NSNotification).userInfo?["Date"] as? Date else {
                return
            }
            self.mainView.bind(date)
        }

        //照度センサーを監視するイベント
        NotificationCenter.default.addObserver(self,
                                               selector: Selector("proximityChanged"),
                                               name:UIDevice.proximityStateDidChangeNotification,
                                               object: nil)

        //時間の変更を監視するイベント
        Notification.onMainThread(self, name: "SettingViewModel.dateValueChanged") { notification in
            guard let date = (notification as NSNotification).userInfo?["Date"] as? Date else {
                return
            }

            //指定の時間-今の時間で次の声をだす
            print("date.timeIntervalSinceNow",date.timeIntervalSinceNow)
            Timer.scheduledTimer(timeInterval: date.timeIntervalSinceNow, target: self, selector: #selector(MainViewModel.updateTimer), userInfo: nil, repeats: false)

            //次は今回読み上げた時間の24時間後に出す
            //let tomorrow = date.timeIntervalSinceNow + (24 * 3600)
            let tomorrow = date.timeIntervalSinceNow + 10
            print("tomorrow",tomorrow)
            if let tiemr = self.timer {
                if tiemr.isValid == true {
                    tiemr.invalidate()
                    print("tiemr.isValid",tiemr.isValid)
                }
                RunLoop.current.remove(<#T##aPort: Port##Port#>, forMode: <#T##RunLoop.Mode#>)
                RunLoop.current
                RunLoop.current.remove(tiemr, forMode: .common)
            }
//            self.timer = Timer.scheduledTimer(timeInterval: tomorrow, target: self, selector: #selector(MainViewModel.updateTimer), userInfo: nil, repeats: true)
//
            
            self.timer = Timer(fire: date, interval: 0, repeats: true, block: { timer in
                print("timer",timer)
                return
            })
            
            guard let timer = self.timer else {
                return
            }
            
            RunLoop.current.add(timer, forMode: .common)
            
        }
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
