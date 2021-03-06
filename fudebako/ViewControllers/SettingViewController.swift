//
//  SettingViewController.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, DialogDisplayable {

    enum CellType {
        case datePickerViewCell
        case defaultCell
    }

    let cellTypes:[CellType] = [.datePickerViewCell,
                                .defaultCell]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Appearance.color.background
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DatePickerViewCell.self, forCellReuseIdentifier: NSStringFromClass(DatePickerViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.sectionFooterHeight = 100

        return tableView
    }()

    private var viewModel: SettingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "設定"
        self.view.backgroundColor = Appearance.color.background
        self.view.addSubViewWithFittingParent(self.tableView)

        self.viewModel = SettingViewModel(self)
        self.viewModel.initEvent()
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SettingViewController: UITableViewDelegate {
    //MARK: セルが選択された時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択解除
        self.tableView.deselectRow(at: indexPath, animated: true)
        let cellType = self.cellTypes[indexPath.row]

        switch cellType {
        case .datePickerViewCell:
            print(".datePickerViewCell")
        case .defaultCell:
            self.viewModel.resetCount()
        }

    }

    //MARK: セルの移動禁止
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    //MARK: セルの編集を禁止
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension SettingViewController: UITableViewDataSource {

    //MARK: セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //MARK: セクションの中に入るセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellTypes.count
    }

    //MARK: どのセルを返すのか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = self.cellTypes[indexPath.row]

        switch cellType {
        case .datePickerViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DatePickerViewCell.self), for: indexPath) as! DatePickerViewCell
            return cell
        case .defaultCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
            cell.textLabel?.text = "カウント回数のリセット"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .red

            return cell
        }
    }

    //MARK: ヘッダーの設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "読み上げ時刻の設定"
    }

    //MARK: 独自フッターの設定
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: HeaderView = HeaderView()
        footerView.backgroundColor = Appearance.color.background
        footerView.textLabel.text = "指定された時刻に読み上げを開始します。"
        return footerView
    }

}

