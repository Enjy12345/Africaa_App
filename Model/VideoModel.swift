//
//  VideoModel.swift
//  Africa
//
//  Created by enjykhaled on 04/03/2022.
//

import Foundation
struct VideoModel:Codable , Identifiable{
    let id : String
    let name : String
    let headline : String
    var thumbnail : String {
        "video-\(id)"
    }
}
