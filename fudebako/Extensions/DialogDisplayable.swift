//
//  DialogDisplayable.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

protocol DialogDisplayable {
    func showDialog(_ title: String?, message: String, success: ((UIAlertAction) -> Void)?, failure: ((UIAlertAction) -> Void)?)
}

extension DialogDisplayable where Self: UIViewController {
    func showDialog(_ title: String?, message: String, success: ((UIAlertAction) -> Void)?, failure: ((UIAlertAction) -> Void)? = nil) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: success)
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: failure)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        self.present(ac, animated: true, completion: nil)
    }
}

