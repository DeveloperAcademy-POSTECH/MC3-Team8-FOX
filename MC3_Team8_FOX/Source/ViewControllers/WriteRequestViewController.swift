//
//  WriteRequestViewController.swift
//  MC3_Team8_FOX
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
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var activity: UITextField!
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var notice: UITextField!
        
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.isEnabled = false
        meetTitle.delegate = self
        destination.delegate = self
        activity.delegate = self
        
        createStartDatePicker()
        createEndDatePicker()
    }
    
    func createStartDatePicker() {
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneStartTimeBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneStartTime))
        toolbar.setItems([doneStartTimeBtn], animated: true)
        
        startTime.inputAccessoryView = toolbar
        
        startTime.inputView = datePicker
    }
    
    func createEndDatePicker() {
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneEndTimeBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneEndTime))
        toolbar.setItems([doneEndTimeBtn], animated: true)

        endTime.inputAccessoryView = toolbar
        
        endTime.inputView = datePicker
    }
    
    @objc func doneStartTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 dd일(EEEEE) H시 mm분"
        formatter.locale = Locale(identifier: "ko_KO")
        
        self.startTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneEndTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 dd일(EEEEE) H시 mm분"
        formatter.locale = Locale(identifier: "ko_KO")
        
        self.endTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func tapCancelBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tapDoneBtn(_ sender: UIButton) {
        var newRequest: NewRequest = NewRequest(meetTitle: meetTitle.text ?? "", destination: destination.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    var meetTitle, destination: String
    var activity, pickUpLocation: String?
}
