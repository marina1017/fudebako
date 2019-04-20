//
//  SettingViewController.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tabelView = UITableView()
        tabelView.backgroundColor = .white
        tabelView.delegate = self
        tabelView.dataSource = self

        return tabelView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubViewWithFittingParent(self.tableView)
        self.navigationItem.title = "設定"
        
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

    }

    //MARK: セルが削除された時
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

}

extension SettingViewController: UITableViewDataSource {
    //MARK: セクション数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    //MARK: どのセルを返すのか
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //あとでやる
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.numberOfLines = 0
        cell.layoutMargins = .zero

        return cell
    }


}

