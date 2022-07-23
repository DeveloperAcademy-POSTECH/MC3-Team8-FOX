//
//  WriteRequestViewController.swift
//  practice
//
//  Created by 윤가희 on 2022/07/19.
//

import Foundation
import UIKit

class WriteRequestViewController: UIViewController {
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!

    @IBOutlet weak var meetTitle: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var activity: UITextField!
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var notice: UITextField!
    
    @IBAction func tapCancelBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func tapDoneBtn(_ sender: UIButton) {
        /*
        if
        var newRequest : NewRequest = NewRequest(meetTitle: meetTitle.text!)
         */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if meetTitle.text?.isEmpty == true {
            self.doneBtn.isEnabled = false
        } else {
            self.doneBtn.isEnabled = true
        }
    }
}

struct NewRequest {
    var meetTitle : String
}
