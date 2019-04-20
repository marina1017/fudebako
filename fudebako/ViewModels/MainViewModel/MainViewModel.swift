//
//  MainViewModel.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation
import UIKit

class MainViewModel {

    var mainView: MainView!

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
    }
    
    @objc func proximityChanged() {
        print(">>>")
        Defaults[.count] += 1
        self.mainView.bindDescription(Defaults[.count])

    }
}
