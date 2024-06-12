//
//  FavoriteTableViewCell.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/06/12.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    /// 名言のLabel
    @IBOutlet private weak var quoteLabel: UILabel!
    /// 部数のLabel
    @IBOutlet private weak var partLabel: UILabel!
    /// キャラクター名のLabel
    @IBOutlet private weak var characterLabel: UILabel!
    
    // MARK: - Other Methods

    func configure(quote: String, part: String, character: String) {
        quoteLabel.text = quote
        partLabel.text = part
        characterLabel.text = character
    }
}
