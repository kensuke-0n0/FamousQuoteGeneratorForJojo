//
//  FavoriteViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/21.
//

import UIKit

/// お気に入り画面
class FavoriteViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        navigationItem.title = "お気に入り"
    }
    
    // MARK: - Other Methods
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        // カスタムセル
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}

// MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDataSource {
    /// セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    /// セクションヘッダービューを設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = FavoriteHeaderView()
        headerView.configure(number: 1, backgroundColor: .red)
        return headerView
        
    }
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! FavoriteTableViewCell
        // ここにセルに渡す処理を書く
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FavoriteViewController: UITableViewDelegate {
    /// セクションヘッダーの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48.0
    }
    
    /// セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
