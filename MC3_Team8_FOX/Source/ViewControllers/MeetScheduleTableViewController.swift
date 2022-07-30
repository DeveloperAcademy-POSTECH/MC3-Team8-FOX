//
//  MeetScheduleTableViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/31.
//

import UIKit
import UIKit

 class MeetScheduleTableViewController: UIViewController {

     @IBOutlet weak var tableView: UITableView!
     let data = LoadData().appointment


     override func viewDidLoad() {
         super.viewDidLoad()

         self.tableView?.delegate = self
         self.tableView?.dataSource = self

     }
 }

 extension MeetScheduleTableViewController: UITableViewDelegate {

 }

 extension MeetScheduleTableViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return data.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
         return cell
     }
 }
