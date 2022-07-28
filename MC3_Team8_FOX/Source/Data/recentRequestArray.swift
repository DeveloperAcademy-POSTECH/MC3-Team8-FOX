//
//  recentRequestArray.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/28.
//

import Foundation

// TODO: approval 상태에 따라 반환값 달라지는 함수로 바꾸기
func LoadRecentRequest(requestTitle: [String], requestDateInfo: [String]) -> ([String], [String]) {
    var title: [String] = []
    var dateInfo: [String] = []
    let data = LoadData().appointment
    
    for i in 0..<data.count {
        if data[i].approval.rawValue == "waiting" {
            title.append(data[i].title)
            dateInfo.append("오후 1:00 - 오후 9:00")
        }
    }
    return (title, dateInfo)
}


