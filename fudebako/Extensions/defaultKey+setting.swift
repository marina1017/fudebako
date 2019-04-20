//
//  defaultKey+setting.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import Foundation

extension DefaultsKeys {

    //音でお知らせされる時間
    public static let notifiedTime = DefaultsKey<Date>("notifiedTime")
    //照度センサーが反応した回数(開けしめした回数)
    public static let count = DefaultsKey<Int>("count")
}

