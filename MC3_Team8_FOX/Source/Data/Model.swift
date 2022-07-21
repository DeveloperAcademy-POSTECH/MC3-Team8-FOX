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
    let title, destination, startTime, endTime: String
    let activity, pickUpLocation, rejectReason: String?
    let isUnreading: Bool
    enum approval: String {
        case waiting
        case rejected
        case approved
    }
}

// MARK: - UserID
struct UserID: Codable {
    let userID: Int
    let partnerID: Int?
    let randomCode: String
}
