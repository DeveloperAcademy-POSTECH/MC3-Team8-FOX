//
//  Connecting.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class ConnectingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var inputCodeTextField: UITextField!
    @IBOutlet weak var inputCodeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputCodeTextField.layer.cornerRadius = 12
        inputCodeButton.layer.cornerRadius = 12
        
        inputCodeTextField.delegate = self
        inputCodeButton.isUserInteractionEnabled = false
        inputCodeTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
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
