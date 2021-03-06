//
//  LocationModel.swift
//  Africa
//
//  Created by enjykhaled on 04/03/2022.
//

import Foundation
import MapKit
struct NationalParkLocation : Codable , Identifiable {
    var id : String
    var name : String
    var image :String
    var latitude :Double
    var longitude : Double
    
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
