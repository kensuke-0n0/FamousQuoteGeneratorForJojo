//
//  Quote8ViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/21.
//

import UIKit

/// 8部名言生成画面
class Quote8ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 名言を表示させるラベル
    @IBOutlet private weak var quoteLabel: UILabel!
    /// キャラクター名を表示させるラベル
    @IBOutlet private weak var characterLabel: UILabel!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if QuotesData.quote8.first != nil {
            quoteLabel.text = "名言生成ッ!!をタップ"
            characterLabel.text = ""}
        configureGradientView(view: self.view)
    }
    
    // MARK: - IBActions
    
    @IBAction private func favoriteButton(_ sender: Any) {
    }
    
    @IBAction private func generateButton(_ sender: Any) {
        //ランダムに名言を設定
        if let randomQuote = QuotesData.quote8.randomElement() {
            quoteLabel.text = randomQuote.quote
            characterLabel.text = randomQuote.characterName
        }
    }
    
    // MARK: - Other Methods
    
    /// UIViewにグラデーションを追加する関数
    private func configureGradientView(view: UIView) {
        let color1 = UIColor(hex: "#E6E6E6")
        let color2 = UIColor(hex: "#000000")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
