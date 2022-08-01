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

    func saveData(appointments: Appointments) {
        do {
            let data = try? JSONEncoder().encode(appointments)
            print("Encode")
            let url = documentDirectory().appendingPathComponent("data")
            print("url")

            try? data?.write(to: url)
            print("data")

        } catch {
            print("fail")
        }
    }

    func loadSavedData() {
        do {
            let url = documentDirectory().appendingPathComponent("data")
            print("url")

            let data = try? Data(contentsOf: url)
            print("data")

            let appointData = try? JSONDecoder().decode([Appointments].self, from: data!)
            print("Decode")

            self.appointment = appointData!
            print("입력 완료~")
        }
    }

    func documentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
