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
        datePicker.datePickerMode = .time
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        //MARK:メモ - UIDatePickerにdelegateは無いので Target-Action design patternで対応する
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControl.Event.valueChanged)
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
        self.addSubViewWithFittingParent(self.datePicker)
    }

    func bind(){
        //特定の時刻を入れてあげる関数
        //self.datePicker
    }

    //datepickerが選択されたら
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        print("てすと",sender)
        //つかうかわからないけど一応準備
        Notification.post("DatePickerViewCell.datePickerValueChanged", userInfo: ["Date": sender.date])
        //userDefaultにデータを保存させる

    }

}
