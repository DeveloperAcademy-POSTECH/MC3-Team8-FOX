//
//  WriteRequestViewController.swift
//  practice
//
//  Created by 윤가희 on 2022/07/19.
//

import Foundation
import UIKit

class WriteRequestViewController: UIViewController, UITextFieldDelegate {
    
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

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.isEnabled = false
        meetTitle.delegate = self
        destination.delegate = self
        activity.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        doneBtn.isEnabled = canSubmit()
    }
    
    func canSubmit() -> Bool {
        if meetTitle.text?.isEmpty == true {
            return false
        } else if destination.text?.isEmpty == true {
            return false
        } else if activity.text?.isEmpty == true {
            return false
        } else {
            return true
        }
    } //필수조건이 모두 입력되었는가
    
}

struct NewRequest {
    var meetTitle : String
}
