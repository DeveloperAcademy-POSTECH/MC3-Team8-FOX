//
//  AcceptRequestViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class AcceptRequestViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    let sending = AcceptRequestTableViewCell()

    @IBOutlet weak var meetTitle: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var sendingNotice: UITableView!
    @IBOutlet weak var acceptingBtn: UIButton!
    @IBOutlet weak var rejectingBtn: UIButton!
    
    let data = LoadData().appointment

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendingNotice.delegate = self
        self.sendingNotice.dataSource = self
        pickUpLocation.addLeftPadding()
        pickUpLocation.text = "Test"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @IBAction func tapAcceptingBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        let newRequest: NewRequest = NewRequest (
        meetTitle: meetTitle.text ?? "",
        startTime: startTime.text ?? "",
        endTime: endTime.text ?? "",
        destination: destination.text ?? "",
        activity: activity.text ?? "",
        pickUpLocation: pickUpLocation.text ?? "",
        sendingNotice: sending.textField?.text ?? ""
        )
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.acceptRequestArray.append(newRequest)
    }
    
    @IBAction func tapRejectingBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension AcceptRequestViewController: UITableViewDelegate {
}

extension AcceptRequestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
// TODO: 공지사항에 대한 JSON 목데이터 필요.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SendingNoticeCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
