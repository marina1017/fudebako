//
//  UIView+extension.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

extension UIView {
    func addSubViewWithFittingParent(_ view: UIView) {
        self.addSubview(view)
        self.addSubViewWithInsetsForParent(view, with: UIEdgeInsets.zero)
    }

    func addSubViewWithInsetsForParent(_ view: UIView, with insets: UIEdgeInsets) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo : self.topAnchor, constant: insets.top).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -insets.right).isActive = true
        //MARK: メモ - leftAnchorとleadingAnchorの違い(https://codeday.me/jp/qa/20190126/169235.html)
    }

}
