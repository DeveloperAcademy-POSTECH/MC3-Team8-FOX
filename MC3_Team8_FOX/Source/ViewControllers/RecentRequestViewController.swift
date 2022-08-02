//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    let mockData = LoadReceivedData().appointment
    var data: [NewRequest] = []
    var receiveRequests: [NewRequest] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView.backgroundColor = UIColor.systemGray5
        self.view.backgroundColor = UIColor.systemGray5

        NotificationCenter.default.addObserver(self, selector: #selector(self.writeRequestModalDone(_:)), name: WriteRequestModalDone, object: nil)
    }

    @objc func writeRequestModalDone(_ noti: Notification) {
        data = appDelegate.newRequestArray
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
}

extension RecentRequestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}

extension RecentRequestViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            data = appDelegate.newRequestArray
            return data.count
        }
        return mockData.count
        
//        if section == 1 {
//            data = appDelegate.newRequestArray
//            return data.count
//
//        }
//        receiveRequests = appDelegate.mockRequestArray
//        return receiveRequests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell

        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        
        if (indexPath.section == 0) {
            cell.meetDate.text = String(mockData[indexPath.row].startTime.dropLast(11).dropFirst(6))
            cell.meetDay.text = String(mockData[indexPath.row].startTime.dropFirst(12).dropLast(9)) + "요일"
            cell.meetTime.text = String(mockData[indexPath.row].startTime.dropFirst(15)) + " - " + String(mockData[indexPath.row].endTime.dropFirst(15))
            cell.meetTheme.text = mockData[indexPath.row].title
        }
        
        else {
            data = appDelegate.newRequestArray

            if data.isEmpty == false {
                cell.meetDate.text = String(data[indexPath.row].startTime.dropLast(12))
                cell.meetTime.text = String(data[indexPath.row].startTime.dropFirst(9)) + " - " + String(data[indexPath.row].endTime.dropFirst(9))
                cell.meetTheme.text = data[indexPath.row].meetTitle
            } else {
                print("NO DATA")
            }
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "받은 요청"
        case 1:
            return "보낸 요청"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
}
    
