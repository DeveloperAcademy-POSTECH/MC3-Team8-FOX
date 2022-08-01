//
//  MeetScheduleTableViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/31.
//

import UIKit

 class MeetScheduleTableViewController: UIViewController {
     
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
     var data: [NewRequest] = []
     var acceptRequests: [NewRequest] = []

     @IBOutlet weak var tableView: UITableView!

     override func viewDidLoad() {
         super.viewDidLoad()

         self.tableView?.delegate = self
         self.tableView?.dataSource = self
     }
     override func viewWillAppear(_ animated: Bool) {
         tableView.reloadData()
     }
 }

 extension MeetScheduleTableViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         data = appDelegate.mockRequestArray
         return data.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
         if let scheduleCell = cell as? ScheduleCell {
             // TODO: 일단, UT를 위한 임시 코드. 수정 반드시 해야함.
             scheduleCell.date.text = String(data[indexPath.row].startTime.dropLast(9))
             scheduleCell.day.text = String((data[indexPath.row].startWeekDay ?? "목") + "요일")
             scheduleCell.title.text = String(data[indexPath.row].meetTitle)
             scheduleCell.time.text = String(data[indexPath.row].startTime.dropFirst(8)) + " - " +
             String(data[indexPath.row].endTime.dropFirst(8))
         }
         return cell
     }
 }
