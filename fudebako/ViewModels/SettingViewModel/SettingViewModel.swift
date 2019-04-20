//
//  SettingViewModel.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation
import UIKit

class SettingViewModel {

    let superViewController: UIViewController!

    init(_ viewController: UIViewController){
        self.superViewController = viewController
    }

    //MARK カウントをリセットする関数
    func resetCount() {
        //DialogDisplayableプロトコルに適合している場合は
        guard let superViewController = self.superViewController as? DialogDisplayable else {
            return
        }
        superViewController.showDialog(nil,
                        message: "カウントした回数が\nリセットされますがよろしいですか？",
                        success: { _ in
                            //センサーが反応した回数を0にする
                            Defaults[.count] = 0
                        },
                        failure: nil)
    }

    //MARK 読み上げ指定時間の保存
    func initEvent() {
        Notification.onMainThread(self, name: "DatePickerViewCell.datePickerValueChanged") { notification in
            guard let date = (notification as NSNotification).userInfo?["Date"] as? Date else {
                return
            }
            Defaults[.notifiedTime] = date
            Notification.post("SettingViewModel.dateValueChanged", userInfo: ["Date": date])
        }
    }

}
