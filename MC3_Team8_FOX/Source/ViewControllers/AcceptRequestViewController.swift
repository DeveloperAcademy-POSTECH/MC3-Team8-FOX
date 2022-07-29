//
//  AcceptRequestViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class AcceptRequestViewController: UIViewController {
    var checkBoxView: CheckBoxView!

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
        self.checkBoxView?.delegate = self
        pickUpLocation.addLeftPadding()
        pickUpLocation.addLeftString(inputText: "  Hi")
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @IBAction func tapAcceptingBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapRejectingBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    func addLeftString(inputText: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height))
        label.text = inputText
        label.font = .systemFont(ofSize: 17, weight: .regular)
        self.leftView = label
        self.leftViewMode = .always
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
        if let sendingNoticeCell = cell as? SendingNoticeCell {
            sendingNoticeCell.content.text = String(data[indexPath.row].startTime.dropLast(14).dropFirst(5))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}


extension AcceptRequestViewController: CheckBoxDelegate {
    func checkBoxHighlight(checkBox: CheckBoxView) {
        print("checkbox 클릭")
        if checkBox.checkLabel.isHidden == false {
            checkBox.checkLabel.isHidden = true
        } else {
            checkBox.checkLabel.isHidden = false
        }
        
    }
}
