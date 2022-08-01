//
//  CollectionHeader.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/31.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    // TODO: init, awakeFromNib, draw, viewDidLoad
    var text: String = "" {
        didSet {
            setSectionTitleLabel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionTitleLabel.textColor = .black
        sectionTitleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    func setSectionTitleLabel() {
        self.sectionTitleLabel.text = text
    }
    
}
