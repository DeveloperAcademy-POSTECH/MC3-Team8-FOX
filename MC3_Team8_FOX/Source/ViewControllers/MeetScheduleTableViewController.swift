//
//  MeetScheduleTableViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/31.
//

import UIKit

class MeetScheduleTableViewController: UIViewController {
     
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
//     var data: [NewRequest] = []
     let data = LoadData().appointment
     var acceptRequests: [NewRequest] = []

     @IBOutlet weak var tableView: UITableView!

     override func viewDidLoad() {
         super.viewDidLoad()
         self.tableView?.delegate = self
         self.tableView?.dataSource = self
         self.tableView.backgroundColor = UIColor.systemGray5
         self.view.backgroundColor = UIColor.systemGray5
     }
     override func viewWillAppear(_ animated: Bool) {
         tableView.reloadData()
     }
 }

 extension MeetScheduleTableViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         data = appDelegate.acceptRequestArray
         return data.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
         
         cell.backgroundColor = UIColor.white
         cell.layer.cornerRadius = 12
         
         if let scheduleCell = cell as? ScheduleCell {
             scheduleCell.title.text = data[indexPath.row].title
             scheduleCell.date.text = String(data[indexPath.row].startTime.dropLast(11).dropFirst(5)) + "." +  String(data[indexPath.row].startTime.dropLast(8).dropFirst(8))
             scheduleCell.time.text = String(data[indexPath.row].startTime.dropFirst(11)) + " - " + String(data[indexPath.row].endTime.dropFirst(11))
         }
         return cell
     }
 }
