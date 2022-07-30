//
//  ScheduleCell.swift
//  MC3_Team8_FOX
//
//  Created by 최성희 on 2022/07/20.
//

import UIKit

class ScheduleCell: UITableViewCell {
    @IBOutlet weak var meetDate: UILabel!
    @IBOutlet weak var meetTime: UILabel!
    @IBOutlet weak var meetTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
