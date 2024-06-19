//
//  Quote3ViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/21.
//

import UIKit

/// 3部名言生成画面
class Quote3ViewController: UIViewController {
    
    // MARK: - Properties
    
    var quote: String = ""
    var characterName: String = ""
    /// 保存済みかどうか
    var isSaved: Bool = false
    /// RealmManagerのシングルトンインスタンスを取得
    let realmManager = RealmManager.shared
    
    // MARK: - IBOutlets
    
    /// 名言を表示させるラベル
    @IBOutlet private weak var quoteLabel: UILabel!
    /// キャラクター名を表示させるラベル
    @IBOutlet private weak var characterLabel: UILabel!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if QuotesData.quote3.first != nil {
            quoteLabel.text = "名言生成ッ!!をタップ"
            characterLabel.text = ""}
        configureGradientView(view: self.view)
    }
    
    // MARK: - IBActions
    
    @IBAction private func didTapFavoriteButton(_ sender: Any) {
        if quote.isEmpty, characterName.isEmpty {
            showAlert(title: "名言を生成してください")
        } else if isSaved {
            showAlert(title: "新しい名言を生成してください")
        } else {
            saveData()
            isSaved = true
        }
    }
    
    @IBAction private func didTapGenerateButton(_ sender: Any) {
        // ランダムに名言を設定
        if let randomQuote = QuotesData.quote3.randomElement() {
            quoteLabel.text = randomQuote.quote
            characterLabel.text = randomQuote.characterName
            quote = randomQuote.quote
            characterName = randomQuote.characterName
        }
        isSaved = false
    }
    
    // MARK: - Other Methods
    
    /// データを保存する
    private func saveData() {
        let dataModel = QuoteDataModel()
        dataModel.quote = quote
        dataModel.part = 3
        dataModel.characterName = characterName
        
        realmManager.add(dataModel, onSuccess: {
            // 成功時の処理
            print("Object added successfully")
            self.showAlert(title: "お気に入りに保存しました")
        }, onFailure: { error in
            // 失敗時の処理
            print("Failed to add object to Realm: \(error)")
            self.showAlert(title: "エラーが発生しました")
        })
    }
    
    /// アラートを表示
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title,
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// UIViewにグラデーションを追加する関数
    private func configureGradientView(view: UIView) {
        let color1 = UIColor(hex: "#0080FF")
        let color2 = UIColor(hex: "#000000")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
