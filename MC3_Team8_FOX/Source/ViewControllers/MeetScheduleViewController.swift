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

    @IBOutlet weak var segment: UISegmentedControl!
    var views: [UIView?] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = [meetScheduleTableView, recentRequestView]

        segment?.selectedSegmentIndex = index

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        self.view.bringSubviewToFront(meetScheduleTableView)
    }


    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if index >= 0 && index < views.count {
            if gesture.direction == UISwipeGestureRecognizer.Direction.right {
                if index != 0 {
                    index -= 1
                    self.view.bringSubviewToFront(views[index]!)
                    segment.selectedSegmentIndex = index
                }
            }

            if gesture.direction == UISwipeGestureRecognizer.Direction.left {
                if index != views.count - 1 {
                    index += 1
                    segment.selectedSegmentIndex = index
                    self.view.bringSubviewToFront(views[index]!)
                }
            }
        }
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        self.view.bringSubviewToFront(views[sender.selectedSegmentIndex]!)
        index = segment.selectedSegmentIndex
    }
}
