//
//  LoadData.swift
//  MC3_Team8_FOX
//
//  Created by yeekim on 2022/07/21.
//

import Foundation

// loade appointments
public class LoadData {
    @Published var appointment = [Appointments]()
    
    init() {
        load()
    }
    
    func load() {
        if let appoint = Bundle.main.url(forResource: "AppointmentMockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: appoint)
                let dataFromJson = try JSONDecoder().decode([Appointments].self, from: data)
                
                self.appointment = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}

// loade receivedAppointments
public class LoadReceivedData {
    @Published var appointment = [Appointments]()
    
    init() {
        load()
    }
    
    func load() {
        if let appoint = Bundle.main.url(forResource: "ReceivedAppointment", withExtension: "json") {
            do {
                let data = try Data(contentsOf: appoint)
                let dataFromJson = try JSONDecoder().decode([Appointments].self, from: data)
                
                self.appointment = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
