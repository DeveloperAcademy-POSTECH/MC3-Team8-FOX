//
//  AcceptRequestViewController.swift
//  MC3_Team8_FOX
//
//  Created by 지준용 on 2022/07/14.
//

import UIKit

class AcceptRequestViewController: UIViewController {

    @IBOutlet weak var meetTitle: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var pickUpLocation: UITextField!
    @IBOutlet weak var sendingNotice: UITableView!

    @IBOutlet weak var acceptingBtn: UIButton!
    @IBOutlet weak var rejectingBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tapAcceptingBtn(_ sender: UIButton) {
    }
    
    @IBAction func tapRejectingBtn(_ sender: UIButton) {

    }
}
