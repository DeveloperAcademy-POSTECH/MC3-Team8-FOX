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
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var segment: UISegmentedControl!
    var views: [UIView] = []
    var index = 0

    let leftTimes: [String] = ["07.10", "07.12", "07.15", "07.19"]
    let middleTimes: [String] = ["13:00", "14:00", "13:30", "16:00"]
    let meetTitle: [String] = ["할머니 생신", "생일파티", "뽁스 생일", "놀이동산"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        views = [meetScheduleTableView, recentRequestView]

//        segment.selectedSegmentIndex = index

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
//        self.view.bringSubviewToFront(meetScheduleTableView)
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
    }


    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if index >= 0 && index < views.count {
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                if index != 0 {
                    index -= 1
                    self.view.bringSubviewToFront(views[index])
                    segment.selectedSegmentIndex = index
                }
            }

            if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                if index != views.count - 1 {
                    index += 1
                    segment.selectedSegmentIndex = index
                    self.view.bringSubviewToFront(views[index])
                }
            }
        }
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
//        self.view.bringSubviewToFront(views[sender.selectedSegmentIndex])
//        index = segment.selectedSegmentIndex
        if sender.selectedSegmentIndex == 0 {
            self.meetScheduleTableView.alpha = 1.0
            self.recentRequestView.alpha = 0.0
        } else if sender.selectedSegmentIndex == 1 {
            self.meetScheduleTableView.alpha = 0.0
            self.recentRequestView.alpha = 1.0
        }
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

//출처: https://www.youtube.com/watch?v=SbeYBZHGvxw
