//
//  Connecting.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class ConnectingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            inputCodeButton.isUserInteractionEnabled = false
        } else {
            inputCodeButton.setTitleColor(UIColor.red ,for: .normal)
            inputCodeButton.backgroundColor = UIColor.black
            inputCodeButton.isUserInteractionEnabled = true
        }
    }
}

