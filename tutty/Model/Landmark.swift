//
//  Landmark.swift
//  tutty
//
//  Created by Yusuf Erkoç on 28.03.2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark:Hashable,Codable,Identifiable{
    let id: Int
    let name:String
    let park:String
    let state:String
    let description:String
    var isFavorite: Bool
    var isFeatured: Bool

    
    var category : Category
    enum Category: String,CaseIterable,Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName:String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
          isFeatured ? Image(imageName + "_feature") : nil
      }
    
    private var coordinates:Coordinates
    var locationCoordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, 
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable,Codable {
        let latitude:Double
        let longitude:Double
    }
}


