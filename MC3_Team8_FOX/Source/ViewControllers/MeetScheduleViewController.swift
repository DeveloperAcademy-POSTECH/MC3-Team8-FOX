//
//  MeetScheduleView.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/20.
//

import UIKit

class MeetScheduleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let leftTimes: [String] = ["07.10", "07.12", "07.15", "07.19"]
    let middleTimes: [String] = ["13:00", "14:00", "13:30", "16:00"]
    let meetTitle: [String] = ["할머니 생신", "생일파티", "뽁스 생일", "놀이동산"]
    
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
        if let scheduleCell = cell as? ScheduleCell {
            scheduleCell.leftTime.text = leftTimes[indexPath.row]
            scheduleCell.middleTime.text = middleTimes[indexPath.row]
            scheduleCell.meetTitle.text = meetTitle[indexPath.row]
        }
        return cell
    }
}


