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

    var boxClosedCount:Int = 0
    //let talker = AVSpeechSynthesizer()

    //MARK: MainView
    private lazy var mainView: MainView = {
        let view = MainView()
        return view
    }()

    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubViewWithInsetsForParent(self.mainView, with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.viewModel = MainViewModel(self.mainView)
        self.viewModel.startTimer()
        self.viewModel.initEvent()

        // 近接監視が有効（true）か無効かを示すブール値
        UIDevice.current.isProximityMonitoringEnabled = true

        //ここから修正が必要
//        Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(MainViewController.timerUpdate), userInfo: nil, repeats: true)
        //ここまで
    }

    override func viewWillAppear(_ animated: Bool) {
        self.mainView.bindDescription(Defaults[.count])
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
//        let utterance = AVSpeechUtterance(string: "本日は\(string)です")
//        let utterance1 = AVSpeechUtterance(string: "本日開かれた回数は\(self.boxClosedCount/2)です")
//        let utterance2 = AVSpeechUtterance(string: "夏休みは残り一週間です")
//        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
//        self.talker.speak(utterance)
//        self.talker.speak(utterance1)
//        self.talker.speak(utterance2)
//    }
}

