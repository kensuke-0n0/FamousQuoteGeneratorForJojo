//
//  FavoriteHeaderView.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/06/12.
//

import UIKit

class FavoriteHeaderView: UIView {
    
    // MARK: - Outlets
    
     @IBOutlet private weak var partLabel: UILabel!
    
     @IBOutlet private weak var partView: UIView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Other Methods
    
    private func setupView() {
        // XIBファイルをロードして、ビューを設定
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FavoriteHeaderView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    func configure(number: Int, backgroundColor: UIColor) {
        partLabel.text = "\(number)部"
        partView.backgroundColor = backgroundColor
    }
}

