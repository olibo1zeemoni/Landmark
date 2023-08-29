//
//  ModelData.swift
//  Landmarks
//
//  Created by Olibo moni on 25/08/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = loadFromJSON()
    //load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    func saveToJson(){
        saveToJSON(landmarks: landmarks)
        print("saving \(landmarks.count) landmarks")
    }
    
    
     
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Could not locate \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could'nt load  \(filename) from main bundle: \n\(error) ")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}


func saveToJSON(landmarks: [Landmark]) {
    do {
        let data = try JSONEncoder().encode(landmarks)
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("landmark.json")
            try data.write(to: fileURL)
        }
    } catch {
        print("Error saving data: \(error)")
    }
}


func loadFromJSON() -> [Landmark] {
    var landmarks: [Landmark] = []
    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = documentsDirectory.appendingPathComponent("landmark.json")
        do {
            let data = try Data(contentsOf: fileURL)
            landmarks = try JSONDecoder().decode([Landmark].self, from: data)
        } catch {
            print("Error loading data: \(error)")
            landmarks = load("landmarkData.json")
        }
    }
    return landmarks
}
