//
//  MeetScheduleView.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/20.
//

import UIKit

class MeetScheduleViewController: UIViewController {
    
    @IBOutlet weak var meetScheduleTableView: UIView!
    @IBOutlet weak var recentRequestView: UIView!
    @IBOutlet weak var meetButton: UILabel! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(meetButtonTouched))
            meetButton.addGestureRecognizer(gesture)
            meetButton.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var requestButton: UILabel! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(requestButtonTouched))
            requestButton.addGestureRecognizer(gesture)
            requestButton.isUserInteractionEnabled = true
        }
    }
    
    var views: [UIView?] = []
    var index = 0
    
    let data = LoadData().appointment
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        views = [meetScheduleTableView, recentRequestView]



        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
//        self.view.bringSubviewToFront(meetScheduleTableView)
        
//        self.tableView?.delegate = self
//        self.tableView?.dataSource = self
        
        
        self.view.backgroundColor = UIColor.systemGray5
        

        self.meetButtonTouched()
    }
    
    @objc func meetButtonTouched() {
        meetButton.textColor = UIColor(hex: "102F54")
        meetButton.font = UIFont.boldSystemFont(ofSize: 17.0)
        requestButton.font = UIFont.systemFont(ofSize: 17.0)
        requestButton.textColor = UIColor(white: 0, alpha: 0.5)

        self.view.bringSubviewToFront(meetScheduleTableView)
    }
    
    @objc func requestButtonTouched() {
        requestButton.textColor = UIColor(hex: "102F54")
        requestButton.font = UIFont.boldSystemFont(ofSize: 17.0)
        meetButton.font = UIFont.systemFont(ofSize: 17.0)
        meetButton.textColor = UIColor(white: 0, alpha: 0.5)
        
        self.view.bringSubviewToFront(recentRequestView)
    }

    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if index >= 0 && index < views.count {
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                if index != 0 {
                    index -= 1
                    self.view.bringSubviewToFront(views[index]!)
                }
            }

            if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                if index != views.count - 1 {
                    index += 1
                    self.view.bringSubviewToFront(views[index]!)
                }
            }
        }
    }

//    @IBAction func switchView(_ sender: UISegmentedControl) {
//        self.view.bringSubviewToFront(views[sender.selectedSegmentIndex]!)
//        index = segment.selectedSegmentIndex
//    }
}
