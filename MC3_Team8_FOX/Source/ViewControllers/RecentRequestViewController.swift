//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController, UITableViewDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var data: [NewRequest] = []
    var receiveRequests: [NewRequest] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self

        NotificationCenter.default.addObserver(self, selector: #selector(self.writeRequestModalDone(_:)), name: WriteRequestModalDone, object: nil)
    }

    @objc func writeRequestModalDone(_ noti: Notification) {
        data = appDelegate.newRequestArray
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
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
        receiveRequests = appDelegate.mockRequestArray
        return receiveRequests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell

        if(indexPath.section == 0) {
            cell.meetDate.text = receiveRequests[indexPath.row].startTime
            cell.meetTime.text = receiveRequests[indexPath.row].startTime
            cell.meetTitle.text = receiveRequests[indexPath.row].meetTitle
        } else {
            data = appDelegate.newRequestArray

            if data.isEmpty == false {
                cell.meetDate.text = data[indexPath.row].startTime
                cell.meetTime.text = data[indexPath.row].startTime
                cell.meetTitle.text = data[indexPath.row].meetTitle
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
        if section == 0 {
            return "받은 요청"
        }
        else if section == 1 {
            return "보낸 요청"
        }
        else {
            return ""
        }
    }
}
