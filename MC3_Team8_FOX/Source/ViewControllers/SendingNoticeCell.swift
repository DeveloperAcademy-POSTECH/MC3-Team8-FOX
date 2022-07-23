//
//  SendingNoticeCell.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/22.
//

import UIKit

class SendingNoticeCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxView: CheckBoxView!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //
    }
}
