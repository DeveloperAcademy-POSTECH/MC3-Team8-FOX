//
//  RejectReason.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

extension UIColor {
    static let btnColor = UIColor(red: 16/255, green: 47/255, blue: 84/255, alpha: 1)
}

class RejectReasonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapCheckBox(_ sender: UIButton) {
        sender.tintColor = sender.tintColor == UIColor.btnColor ? UIColor.gray : UIColor.btnColor
    }
}

