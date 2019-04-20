//
//  NotificationCountUserDefault.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation

class NotificationCountUserDefault {
    //保存しなければいけないもの
    //id:1  何時に読み上げるか (型はDate)
    //id:2  センサーが覆われた回数 (型はInt)

    //ここでできる必要があること
    //よみとり
    //アップデート
    //保存


    let idKey = "Id"
    typealias IdOrderedByDate = [String]

//    func load(_ key: String) {
//        let saved = self.getSavedUserDefaults(key)
//    }
//
//    func update(_ id: String, to follow: Bool, onSuccess success: () -> (), onError error: (NSError) -> ()) {
//        var saved = self.getSavedIdList()
//
//        func removeIdFromSavedIdList(_ id: String) {
//            guard let removingIndex = saved.index(of: id) else { return }
//            saved.remove(at: removingIndex)
//        }
//
//        if follow {
//            removeIdFromSavedIdList(id)
//            saved.append(id)
//        } else {
//            removeIdFromSavedIdList(id)
//        }
//        UserDefaults.standard.set(saved, forKey: idKey)
//        success()
//    }

//    private func getSavedUserDefaults(_ key: String) -> Date? {
//        //UserDefaults.standard.set(tel, forKey: Constants.User.notifiedTime.rawValue)
//        return UserDefaults.standard.data(forKey: key)
//    }
}
