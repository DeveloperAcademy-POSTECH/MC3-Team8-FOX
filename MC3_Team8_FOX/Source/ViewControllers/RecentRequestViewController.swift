//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let data = LoadData().appointment
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RecentRequestViewController: UITableViewDelegate {
    
}

extension RecentRequestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentRequestCell", for: indexPath)
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
