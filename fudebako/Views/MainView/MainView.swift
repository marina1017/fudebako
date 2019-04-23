//
//  MainView.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class MainView: UIView {
    //MARK: 時間を表示するLabel
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 100.0)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        let f = DateFormatter()
        f.timeStyle = .short
        f.dateStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let now = Date()
        label.text = f.string(from: now)
        return label
    }()

    //MARK:「今日は○回開けました」を表示するLabel
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = Appearance.font.label(20, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.text = "今日は0回開けました"
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
        self.backgroundColor = .black
    }

    //MARK: 制約を決める
    private func setUpConstraints(){
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            self.timeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30.0).isActive = true
        } else {
            self.timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80.0).isActive = true
        }
        self.timeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        self.timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
        self.timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true

        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 2.0).isActive = true
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        self.descriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }

    //MARK: 最新時間の更新
    func bind(_ data: Date) {
        let f = DateFormatter()
        f.timeStyle = .short
        f.dateStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        self.timeLabel.text = f.string(from: data)
    }

    //MARK: 最新時間の更新
    func bindDescription(_ data: Int) {
        self.descriptionLabel.text = "本日開かれた回数は\(data/2)回です"
    }

}
