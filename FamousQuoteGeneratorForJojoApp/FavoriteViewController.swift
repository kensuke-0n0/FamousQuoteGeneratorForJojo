//
//  FavoriteViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/21.
//

import UIKit
import RealmSwift

/// お気に入り画面
class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    
    /// RealmManagerのシングルトンインスタンスを取得
    let realmManager = RealmManager.shared
    
    /// 取得したデータの格納先
    var groupedQuotes = Array(repeating: [QuoteDataModel](), count: 8)
    
    /// セクションヘッダー表示用の配列
    var displayedSections: [Int] = []
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchData()
        
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
    
    /// データを取得
    private func fetchData() {
        let results = realmManager.getObjects(QuoteDataModel.self)
        // 部数に合ったセクションナンバーで二次元配列に格納
        for quote in results {
            let sectionIndex = quote.part - 1
            if sectionIndex >= 0 && sectionIndex < groupedQuotes.count {
                groupedQuotes[sectionIndex].append(quote)
            }
            self.displayedSections.append(sectionIndex)
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDataSource {
    /// セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    /// セクションヘッダービューを設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = FavoriteHeaderView()
        switch section {
        case 0:
            if displayedSections.contains(0) {
                headerView.configure(number: 1, backgroundColor: UIColor(hex: "#08CF79"))
            } else {
                headerView.isHidden = true
            }
        case 1:
            if displayedSections.contains(1) {
                headerView.configure(number: 2, backgroundColor: UIColor(hex: "#57FF03"))
            } else {
                headerView.isHidden = true
            }
        case 2:
            if displayedSections.contains(2) {
                headerView.configure(number: 3, backgroundColor: UIColor(hex: "#0080FF"))
            } else {
                headerView.isHidden = true
            }
        case 3:
            if displayedSections.contains(3) {
                headerView.configure(number: 4, backgroundColor: UIColor(hex: "#B266FF"))
            } else {
                headerView.isHidden = true
            }
        case 4:
            if displayedSections.contains(4) {
                headerView.configure(number: 5, backgroundColor: UIColor(hex: "#FFFF99"))
            } else {
                headerView.isHidden = true
            }
        case 5:
            if displayedSections.contains(5) {
                headerView.configure(number: 6, backgroundColor: UIColor(hex: "#87EBFF"))
            } else {
                headerView.isHidden = true
            }
        case 6:
            if displayedSections.contains(6) {
                headerView.configure(number: 7, backgroundColor: UIColor(hex: "#FFCC99"))
            } else {
                headerView.isHidden = true
            }
        case 7:
            if displayedSections.contains(7) {
                headerView.configure(number: 8, backgroundColor: UIColor(hex: "#E6E6E6"))
            } else {
                headerView.isHidden = true
            }
        default:
            break
        }
        return headerView
    }
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedQuotes[section].count
    }
    
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! FavoriteTableViewCell
        // ここにセルに渡す処理を書く
        let quote = groupedQuotes[indexPath.section][indexPath.row]
        cell.configure(quote: quote.quote,
                       part: "\(quote.part)部",
                       character: quote.characterName)
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
