//
//  DatePickerView.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class DatePickerViewCell: UITableViewCell {
    
    lazy var datePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.backgroundColor = .white
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        return datePicker
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = .red
        self.addSubViewWithFittingParent(self.datePicker)
    }

}
