//
//  MockUpData.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/19.
//

import Foundation

// MARK: - Appointments
struct Appointments: Codable {
    let userID: UserID
    let appointmentID: Int
    let title, destination, startTime, endTime, activity: String
    let pickUpLocation, rejectReason: String?
    let isUnreading: Bool
    let approval: approvalStatus
    
}

enum approvalStatus: String, Codable {
        case waiting = "waiting"
        case rejected = "rejected"
        case approved = "approved"
}

// MARK: - UserID
struct UserID: Codable {
    let userID: Int
    let partnerID: Int?
    let randomCode: String
}
