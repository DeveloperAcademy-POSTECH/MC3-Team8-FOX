//
//  MeetScheduleView.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/20.
//

import UIKit

class MeetScheduleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let data = LoadData().appointment
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension MeetScheduleViewController: UITableViewDelegate {
    
}

extension MeetScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
        if let scheduleCell = cell as? ScheduleCell {
            scheduleCell.leftTime.text = String(data[indexPath.row].startTime.dropLast(14).dropFirst(5))
            scheduleCell.middleTime.text = String(data[indexPath.row].startTime.dropLast(8).dropFirst(11))
            scheduleCell.meetTitle.text = data[indexPath.row].title
        }
        return cell
    }
}


