//
//  File.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation

class Notification {

    // MARK: - Singleton

    struct Static {
        static let instance = Notification()
        static let queue = DispatchQueue(label: "NotificationQueue", attributes: [])
    }

    var cache = [UInt:[NSObjectProtocol]]()

    // MARK: - addObserverForName

    class func on(_ target: AnyObject, name: String, queue: OperationQueue?, handler: @escaping ((Foundation.Notification) -> Void)) {
        let id = UInt(bitPattern: ObjectIdentifier(target))

        Static.queue.sync {
            let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: name), object: nil, queue: queue, using: handler)
            if let observers = Static.instance.cache[id] {
                Static.instance.cache[id] = observers + [observer]
            } else {
                Static.instance.cache[id] = [observer]
            }
        }
    }

    class func onMainThread(_ target: AnyObject, name: String, handler: @escaping ((Foundation.Notification) -> Void)) {
        Notification.on(target, name: name, queue: OperationQueue.main, handler: handler)
    }

    class func onBackgroundThread(_ target: AnyObject, name: String, handler: @escaping ((Foundation.Notification) -> Void)) {
        Notification.on(target, name: name, queue: OperationQueue(), handler: handler)
    }

    // MARK: - removeObserver

    class func off(_ target: AnyObject) {
        let id = UInt(bitPattern: ObjectIdentifier(target))

        Static.queue.sync {
            if let observers = Static.instance.cache[id] {
                for observer in observers {
                    NotificationCenter.default.removeObserver(observer)
                }
                Static.instance.cache.removeValue(forKey: id)
            }
        }
    }

    // MARK: - postNotificationName

    class func post(_ name: String) {
        NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: name), object: nil)
    }

    class func post(_ name: String, userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
    }

}

