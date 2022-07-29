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
    var mockRequestArray: [NewRequest] = [
        NewRequest(
            meetTitle: "저녁 식사",
            startTime: "8.11.(목) 오후 4:00",
            endTime: "8.11.(목) 오후 9:00",
            destination: "영일대",
            activity: "저녁 식사, 산책",
            pickUpLocation: "효자 교회 정문"
        ),
        NewRequest(
            meetTitle: "여름 휴가",
            startTime: "8.25.(목) 오후 1:00",
            endTime: "8.26.(금) 오후 9:00",
            destination: "해운대",
            activity: "바다 수영",
            pickUpLocation: "포항역"
        )
    ]
    
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
}

extension RecentRequestViewController: UITableViewDelegate {
}

extension RecentRequestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            data = appDelegate.newRequestArray
            return data.count
        }
        return mockRequestArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell
        
        if(indexPath.section == 0) {
            cell.meetDate.text = mockRequestArray[indexPath.row].startTime
            cell.meetTime.text = mockRequestArray[indexPath.row].startTime
            cell.meetTitle.text = mockRequestArray[indexPath.row].meetTitle
        } else {
            data = appDelegate.newRequestArray

            if data.isEmpty == false {
                cell.meetDate.text = data[indexPath.row].startTime
                print(data[indexPath.row].startTime)
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
