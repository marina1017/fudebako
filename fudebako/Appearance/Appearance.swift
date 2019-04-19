//
//  Appearance.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//
import UIKit

class MainView: UIView {
    //時間を表示するLabel
    private var timeLabel: UILabel!
    //「今日は○回開けました」を表示するLabel
    private var descriptionLabel: UILabel!

    override init(frame: CGRect){
        super.init(frame:frame)
        self.setUp()
    }

    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: セットアップ
    private func setUp() {
        self.setUpConstraints()
    }

    //MARK: 制約を決める
    private func setUpConstraints(){

    }

}
