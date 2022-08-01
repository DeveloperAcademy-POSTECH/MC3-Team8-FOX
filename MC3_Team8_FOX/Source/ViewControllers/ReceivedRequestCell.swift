//
//  ReceivedRequestCell.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/23.
//

import UIKit

class ReceivedRequestCell: UITableViewCell {

 
    @IBOutlet weak var meetDate: UILabel!
    @IBOutlet weak var meetDay: UILabel!
    @IBOutlet weak var meetTheme: UILabel!
    @IBOutlet weak var meetTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }

}
