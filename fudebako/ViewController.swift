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
        UIScreen.main.brightness = 0.9
        let center = NotificationCenter.default
        
        center.addObserver(self,
                           selector: #selector(type(of: self).notified(notification:)),
                           name: Notification.Name.UIApplicationDidBecomeActive,
                           object: nil)
//        // 近接監視が有効（true）か無効かを示すブール値
//        UIDevice.current.isProximityMonitoringEnabled = true
//
//        // Observe proximity state
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(proximitySensorStateDidChange),
//                                               name:Notification.Name.proximityStateDidChangeNotification,
//                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Finish observation
        //UIDevice.current.isProximityMonitoringEnabled = false
        
//        NotificationCenter.default.removeObserver(self,
//                                                  name: NSNotification.Name.UIDeviceProximityStateDidChange,
//                                                  object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Internal method
    
//    @objc func proximitySensorStateDidChange() {
//        print("proximityState : \(UIDevice.current.proximityState)")
//    }


}

