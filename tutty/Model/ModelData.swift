//
//  Model.swift
//  tutty
//
//  Created by Yusuf Erkoç on 28.03.2024.
//

import Foundation


@Observable
class ModelData {
    var landmarks : [Landmark]  = load("landmarkData.json")
    var hikes : [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }
    
    var categories : [String:[Landmark]] {
        Dictionary(grouping: landmarks, by: {$0.category.rawValue}
        )
    }

}

func load<T: Decodable>(_ filename:String) -> T {
    print("Called")
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil ) else {
        fatalError("couldnt find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch let error as DecodingError{
        fatalError("couldnt parse \(filename) as \(T.self):\n\(error)")
    } catch {
        fatalError("couldnt create the data with url \(file)")
    }

}
