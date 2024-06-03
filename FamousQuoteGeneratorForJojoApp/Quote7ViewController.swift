//
//  Quote7ViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/21.
//

import UIKit

class Quote7ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 名言を表示させるラベル
    @IBOutlet weak var quoteLabel: UILabel!
    /// キャラクター名を表示させるラベル
    @IBOutlet weak var characterLabel: UILabel!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if QuotesData.quote7.first != nil {
            quoteLabel.text = "名言生成ッ!!をタップ"
            characterLabel.text = ""}
        configureGradientView(view: self.view)
    }
    
    // MARK: - IBActions
    
    @IBAction func favoriteButton(_ sender: Any) {
    }
    
    @IBAction func generateButton(_ sender: Any) {
        //ランダムに名言を設定
        if let randomQuote = QuotesData.quote7.randomElement() {
            quoteLabel.text = randomQuote.quote
            characterLabel.text = randomQuote.characterName
        }
    }
    
    // MARK: - Other Methods
    
    /// UIViewにグラデーションを追加する関数
    private func configureGradientView(view: UIView) {
        let color1 = UIColor(hex: "#FFCC99")
        let color2 = UIColor(hex: "#000000")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
