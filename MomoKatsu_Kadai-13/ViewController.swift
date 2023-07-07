///
//  ViewController.swift
//  MomoKatsu_Kadai-13
// Part13 4つの項目がチェックマーク付きで表示されるアプリ
//  Created by モモカツ on 2023/07/07.

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // 構造体を設定
    struct ItemValue {
        var selectName: String
        var selectCheck: Bool
    }
    // 表示する値を構造体で設定
    var selectItems:[ItemValue] = []

    // テーブルビューに表示するデータを返すメソッド（スクロールなどでページを更新する必要が出るたびに呼び出される）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath as IndexPath) as UITableViewCell

        //cell.imageView!.image = nil
        // チェックマークを"true"の場合付ける
        // "nil"では、空白とならないため空白のファイルを作成し貼り付ける様にした
        cell.imageView!.image = UIImage(named: "nocheck")
        if selectItems[indexPath.row].selectCheck == true {
            cell.imageView!.image = UIImage(named: "check")
        }
        cell.textLabel!.text = selectItems[indexPath.row].selectName
        return cell
    }
    // テーブルビューに表示するデータ個数を返すメソッド
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        //print("データ個数：", selectItems.count)
        return selectItems.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // テーブルビュー表示内容
        selectItems = [
            ItemValue(selectName: "りんご", selectCheck: false),
            ItemValue(selectName: "みかん", selectCheck: true),
            ItemValue(selectName: "バナナ", selectCheck: false),
            ItemValue(selectName: "パイナップル", selectCheck: true),
        ]
    }


}

