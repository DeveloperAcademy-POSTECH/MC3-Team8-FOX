//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var data: [NewRequest] = []
    var receiveRequests: [NewRequest] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self

        self.tableView.frame = self.tableView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))

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
        return 84
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}

extension RecentRequestViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            // 받은 요청 갯수
            return 2
        case 1:
            // 보낸 요청 갯수
            return 3
        default:
            return 0
        }
        if section == 1 {
            data = appDelegate.newRequestArray
            return data.count
            
        }
        receiveRequests = appDelegate.mockRequestArray
        return receiveRequests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell

//        if(indexPath.section == 0) {
//            cell.meetDate.text = receiveRequests[0].startTime
//            cell.meetTime.text = receiveRequests[0].startTime
//            cell.meetTheme.text = receiveRequests[0].meetTitle
//        } else {
//            data = appDelegate.newRequestArray
//
//            if data.isEmpty == false {
//                cell.meetDate.text = data[indexPath.row].startTime
//                cell.meetTime.text = data[indexPath.row].startTime
//                cell.meetTheme.text = data[indexPath.row].meetTitle
//            } else {
//                print("NO DATA")
//            }
//        }
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
}
    
