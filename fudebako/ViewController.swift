//
//  ViewController.swift
//  fudebako
//
//  Created by 中川万莉奈 on 2019/04/04.
//  Copyright © 2019年 中川万莉奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 近接監視が有効（true）か無効かを示すブール値
        UIDevice.current.isProximityMonitoringEnabled = true
        //照度センサーを監視
        NotificationCenter.default.addObserver(self,
                                               selector: Selector("proximityChanged"),
                                               name:UIDevice.proximityStateDidChangeNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func proximityChanged() {
        print(">>>")
        //状態を表示
        print("\(UIDevice.current.proximityState)")
    }
}

