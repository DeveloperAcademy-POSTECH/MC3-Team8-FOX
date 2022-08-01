//
//  MeetScheduleTableViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/31.
//

import UIKit
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
         data = appDelegate.acceptRequestArray
         return data.count
     }
     

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
         if let scheduleCell = cell as? ScheduleCell {
//             scheduleCell.meetDate.text = String(data[indexPath.row].startTime.dropLast(6))
//             scheduleCell.meetTime.text = String(data[indexPath.row].startTime.dropFirst(6))
//             scheduleCell.meetTitle.text = data[indexPath.row].meetTitle
         }
         return cell
     }
 }
