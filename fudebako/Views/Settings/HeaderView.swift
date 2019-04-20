//
//  TopicsHeaderView.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {

    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.backgroundColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubViewWithInsetsForParent(textLabel, with: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(_ title: String) {
        self.textLabel.text = title
    }

}

