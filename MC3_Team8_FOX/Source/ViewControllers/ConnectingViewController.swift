//
//  Connecting.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class ConnectingViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var inputCodeTextField: UITextField!
    @IBOutlet weak var inputCodeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputCodeTextField.layer.cornerRadius = 12
        inputCodeButton.layer.cornerRadius = 12
    }
    
}
