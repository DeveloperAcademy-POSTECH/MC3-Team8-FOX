//
//  RecentRequest.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/14.
//

import UIKit

class RecentRequestViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var data : [NewRequest] = []
    let mockData = LoadReceivedData().appointment
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray5
        self.view.backgroundColor = UIColor.systemGray5
    }
}

extension RecentRequestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 보낸요청
        if section == 1 {
            data = appDelegate.newRequestArray
            return data.count
        }
        // 받은요청
        return mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReceivedRequestCell", for: indexPath) as! ReceivedRequestCell
        
        // boundary area
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        
        cell.meetDate.text = String(mockData[indexPath.row].startTime.dropLast(11).dropFirst(6))
        cell.meetDay.text = String(mockData[indexPath.row].startTime.dropFirst(12).dropLast(9)) + "요일"
        cell.meetTime.text = String(mockData[indexPath.row].startTime.dropFirst(15)) + " - " + String(mockData[indexPath.row].endTime.dropFirst(15))
        cell.meetTheme.text = mockData[indexPath.row].title
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}


extension RecentRequestViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind != UICollectionView.elementKindSectionHeader {
            return UICollectionReusableView()
        }
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeader", for: indexPath) as? CollectionHeader else { return UICollectionReusableView() }
        
        if (indexPath.section == 0) {
            headerView.text = "받은 요청"
        }
        else {
            headerView.text = "보낸 요청"
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        }
    
    
}
