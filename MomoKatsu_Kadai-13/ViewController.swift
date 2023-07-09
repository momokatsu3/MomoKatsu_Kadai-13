///
//  ViewController.swift
//  MomoKatsu_Kadai-13
// Part13 4つの項目がチェックマーク付きで表示されるアプリ
//  Created by モモカツ on 2023/07/07.

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // 構造体を設定
    struct ItemValue {
        var name: String
        var check: Bool
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
        if selectItems[indexPath.row].check {
            cell.imageView!.image = UIImage(named: "check")
        } else {
            cell.imageView!.image = UIImage(named: "nocheck")
        }

        cell.textLabel!.text = selectItems[indexPath.row].name
        return cell
    }
    // テーブルビューに表示するデータ個数を返すメソッド
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        //print("データ個数：", selectItems.count)
        return selectItems.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // テーブルビュー表示内容
        selectItems = [
            ItemValue(name: "りんご", check: false),
            ItemValue(name: "みかん", check: true),
            ItemValue(name: "バナナ", check: false),
            ItemValue(name: "パイナップル", check: true),
        ]
    }
}
