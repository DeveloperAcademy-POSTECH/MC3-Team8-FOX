//
//  ScheduleCell.swift
//  MC3_Team8_FOX
//
//  Created by 최성희 on 2022/07/20.
//

import UIKit

class ScheduleCell: UITableViewCell {
    @IBOutlet weak var leftTime: UILabel!
    @IBOutlet weak var middleTime: UILabel!
    @IBOutlet weak var meetTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
