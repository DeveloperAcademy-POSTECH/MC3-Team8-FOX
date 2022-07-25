//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let data = LoadData().appointment
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
}

extension RecentRequestViewController: UITableViewDelegate {
    
}

extension RecentRequestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else if section == 1 {
            return 3
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: 타입캐스팅 옵셔널로 바꿔야할까?
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell
        cell.meetDate.text = String(data[indexPath.row].startTime.dropLast(14).dropFirst(5))
        cell.meetTime.text = String(data[indexPath.row].startTime.dropLast(8).dropFirst(11))
        cell.meetTitle.text = data[indexPath.row].title
        
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
