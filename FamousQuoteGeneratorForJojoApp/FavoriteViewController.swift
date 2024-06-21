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
                if !displayedSections.contains(sectionIndex) {
                    displayedSections.append(sectionIndex)
                }
            }
        }
        displayedSections.sort()  // セクションをソートして順序を保つ
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDataSource {
    /// セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return displayedSections.count
    }
    
    /// セクションヘッダービューを設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = FavoriteHeaderView()
        let sectionIndex = displayedSections[section]
        let backgroundColors = [
            UIColor(hex: "#08CF79"),
            UIColor(hex: "#57FF03"),
            UIColor(hex: "#0080FF"),
            UIColor(hex: "#B266FF"),
            UIColor(hex: "#FFFF99"),
            UIColor(hex: "#87EBFF"),
            UIColor(hex: "#FFCC99"),
            UIColor(hex: "#E6E6E6")
        ]
        
        if sectionIndex >= 0 && sectionIndex < backgroundColors.count {
            headerView.configure(number: sectionIndex + 1, backgroundColor: backgroundColors[sectionIndex])
        } else {
            headerView.isHidden = true
        }
        
        return headerView
    }
    
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionIndex = displayedSections[section]
        return groupedQuotes[sectionIndex].count
    }
    
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        let sectionIndex = displayedSections[indexPath.section]
        let quote = groupedQuotes[sectionIndex][indexPath.row]
        cell.configure(quote: quote.quote, part: "\(quote.part)部", character: quote.characterName)
        return cell
    }
    
    // セルをスワイプして削除するためのメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let sectionIndex = displayedSections[indexPath.section]
            let quoteToDelete = groupedQuotes[sectionIndex][indexPath.row]
            
            // Realmから削除
            realmManager.delete(quoteToDelete, onSuccess: {
                // 配列から削除
                self.groupedQuotes[sectionIndex].remove(at: indexPath.row)
                
                // セクションが空になったら表示セクションからも削除
                if self.groupedQuotes[sectionIndex].isEmpty {
                    self.displayedSections.remove(at: indexPath.section)
                    tableView.deleteSections([indexPath.section], with: .automatic)
                } else {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
                
            }, onFailure: { error in
                // エラー処理
                print("Failed to delete object from Realm: \(error)")
                self.showAlert()
            })
        }
    }
    
    /// アラートを表示
    private func showAlert() {
        let alert = UIAlertController(title: "エラーが発生しました",
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
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
