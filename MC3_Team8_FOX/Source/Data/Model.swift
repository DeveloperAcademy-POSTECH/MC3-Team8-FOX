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
    let display, naverRead: Bool
    let approval: String
//    enum approval: String {
//        case waiting
//        case rejected
//        case approved
//    }
}

// MARK: - UserID
struct UserID: Codable {
    let userID, partnerID: Int
    let randomCode: String
    let checkRequest: Bool
}

//let decoder = JSONDecoder()

//let appointments = try? newJSONDecoder().decode(Appointments.self, from: jsonData)
let appointments = try? JSONDecoder().decode(Appointments.self, from: jsonData)
