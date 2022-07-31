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
    
   
    
    @IBOutlet weak var collectionHeaderView: CollectionHeader!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGray5
        self.view.backgroundColor = UIColor.systemGray5
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
}

extension RecentRequestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // added data 화면 테스트 위해, 잠시 주석처리
//        if section == 1 {
//            data = appDelegate.newRequestArray
//            return data.count
//        }
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
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        // headerView check
        headerView.backgroundColor = .red
        
        
        
        
//        if (indexPath.section == 0) {
//            headerView.sectionTitle.text = "hihi"
//            headerView.sectionTitle.text = "받은 요청"
//        }
//        else {
//            headerView.sectionTitle.text = "보낸 요청"
//        }
        
        
        return headerView
    }
}
