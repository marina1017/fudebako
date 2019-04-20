//
//  MainView.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class MainView: UIView {
    //時間を表示するLabel
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 150.0)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "15:00"
        return label
    }()

    //「今日は○回開けました」を表示するLabel
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "今日は3回開けました"
        return label
    }()


    override init(frame: CGRect){
        super.init(frame:frame)
        self.setUp()
    }

    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: セットアップ
    private func setUp() {
        self.addSubview(self.timeLabel)
        self.addSubview(self.descriptionLabel)
        self.setUpConstraints()
    }

    //MARK: 制約を決める
    private func setUpConstraints(){
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0).isActive = true
        self.timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        self.timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true

        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 2.0).isActive = true
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
    }

}
