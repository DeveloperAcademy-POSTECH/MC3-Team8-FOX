//
//  LoadNewRequest.swift
//  MC3_Team8_FOX
//
//  Created by 윤가희 on 2022/07/27.
//

import Foundation

// loade appointments
public class LoadNewRequest {
    @Published var appointment = [Appointments]()
    
    init() {
        load()
    }
    
    func load() {
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print("LOADFUNC")
        let fileURL = documentURL.appendingPathComponent("newRequestFileTest.json")
        
        do {
            let data = try Data(contentsOf: fileURL)
            let dataFromJson = try JSONDecoder().decode([Appointments].self, from: data)
            print("FINDFILE")
            self.appointment = dataFromJson
        } catch {
            print(error)
        }
        
        /*
        if let appoint = Bundle.main.url(forResource: "newRequestFileTest", withExtension: "json") {
            do {
                let data = try Data(contentsOf: appoint)
                let dataFromJson = try JSONDecoder().decode([Appointments].self, from: data)
                print("FINDFILE")
                self.appointment = dataFromJson
            } catch {
                print("NOTFIND")
                print(error)
            }
        }
        */
        print("FIN")
    }
}
