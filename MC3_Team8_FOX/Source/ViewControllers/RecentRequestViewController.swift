//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    
    var data: [NewRequest] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.writeRequestModalDone(_:)), name: WriteRequestModalDone, object: nil)
    }
    
    @objc func writeRequestModalDone(_ noti: Notification) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        data = appDelegate.newRequestArray

        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
}

extension RecentRequestViewController: UITableViewDelegate {
}

extension RecentRequestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        data = appDelegate.newRequestArray
        print(data.count)
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        data = appDelegate.newRequestArray

        if data.isEmpty == false {
            cell.meetTitle.text = data[indexPath.row].meetTitle
        } else {
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
