//
//  TopicsHeaderView.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {

    lazy var textLabel: UITextView = {
        let textLabel = UITextView()
        textLabel.backgroundColor = .clear
        textLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        return textLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(){
        self.addSubViewWithInsetsForParent(self.textLabel, with: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
    }

    func setTitle(_ title: String) {
        self.textLabel.text = title
    }

}

