//
//  WriteRequestViewController.swift
//  MC3_Team8_FOX
//
//  Created by 윤가희 on 2022/07/19.
//

import Foundation
import UIKit

let WriteRequestModalDone: Notification.Name = Notification.Name("WriteRequestModalDone")

class WriteRequestViewController: UIViewController, UITextFieldDelegate {

    var sending = TextFieldOfTableViewCell()
    var num = 0
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!

    @IBOutlet weak var meetTitle: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var activity: UITextField!
    @IBOutlet weak var pickUpLocation: UITextField!

    @IBOutlet weak var sendingNoticeTableView: UITableView!
    
    let datePicker = UIDatePicker()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBtn.isEnabled = false
        meetTitle.delegate = self
        destination.delegate = self
        activity.delegate = self

        createStartDatePicker()
        createEndDatePicker()
        
        sendingNoticeTableView.delegate = self
        sendingNoticeTableView.dataSource = self
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
        formatter.dateFormat = "M.dd.(EEEEE) a h:mm"
        formatter.locale = Locale(identifier: "ko_KO")

        self.startTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneEndTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "M.dd.(EEEEE) a h:mm"
        formatter.locale = Locale(identifier: "ko_KO")

        self.endTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @IBAction func tapCancelBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tapDoneBtn(_ sender: UIButton) {
        let newRequest: NewRequest = NewRequest(
            meetTitle: meetTitle.text ?? "",
            startTime: startTime.text ?? "",
            endTime: endTime.text ?? "",
            destination: destination.text ?? "",
            activity: activity.text ?? "",
            pickUpLocation: pickUpLocation.text ?? "",
            sendingNotice: sending.sendingNotice?.text ?? ""
        )

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.newRequestArray.append(newRequest)
        
        NotificationCenter.default.post(name: WriteRequestModalDone, object: nil, userInfo: nil)
        dismiss(animated: true)
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
        } else if startTime.text?.isEmpty == true {
            return false
        } else if endTime.text?.isEmpty == true {
            return false
        } else {
            return true
        }
    } //필수조건이 모두 입력되었는가
    
    @IBAction func tapPlusBtn(_ sender: UIButton) {
        num = num + 1
        print(num)
        OperationQueue.main.addOperation {
            self.sendingNoticeTableView.reloadData()
        }
    }
}

struct NewRequest {
    var meetTitle, startTime, endTime, destination, activity: String
    var pickUpLocation, sendingNotice: String?
}

extension WriteRequestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldOfTableViewCell", for: indexPath)
        return cell
    }
}
