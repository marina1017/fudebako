//
//  ViewController.swift
//  fudebako
//
//  Created by 中川万莉奈 on 2019/04/04.
//  Copyright © 2019年 中川万莉奈. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    //    var boxClosedCount:Int = 0
    //    let talker = AVSpeechSynthesizer()

    //MARK: MainView
    private lazy var mainView: UIView = {
        let view = MainView()
        return view
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubViewWithInsetsForParent(self.mainView, with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.navigationItem.title = "タイマー"
//        // 近接監視が有効（true）か無効かを示すブール値
//        UIDevice.current.isProximityMonitoringEnabled = true
//        //照度センサーを監視
//        NotificationCenter.default.addObserver(self,
//                                               selector: Selector("proximityChanged"),
//                                               name:UIDevice.proximityStateDidChangeNotification,
//                                               object: nil)
//        Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(MainViewController.timerUpdate), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    @objc func timerUpdate() {
//        let now = Date()
//
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .short
//        formatter.locale = Locale(identifier: "ja_JP")
//
//        let string = formatter.string(from: now)
//
//        print(string)
//        let utterance = AVSpeechUtterance(string: "本日は\(string)です")
//        let utterance1 = AVSpeechUtterance(string: "本日開かれた回数は\(self.boxClosedCount/2)です")
//        let utterance2 = AVSpeechUtterance(string: "夏休みは残り一週間です")
//        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
//        self.talker.speak(utterance)
//        self.talker.speak(utterance1)
//        self.talker.speak(utterance2)
//    }
//
//    @objc func proximityChanged() {
//        print(">>>")
//        //状態を表示
//        print("\(UIDevice.current.proximityState)")
//        self.boxClosedCount += 1
//        print("self.boxClosedCount",self.boxClosedCount)
//
//    }
}

