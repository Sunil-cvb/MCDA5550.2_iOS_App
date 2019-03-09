//
//  Constants.swift
//  GetGoingClass
//
//  Created by Alla Bondarenko on 2019-01-21.
//  Copyright © 2019 SMU. All rights reserved.
//

import Foundation

class Constants {

    static let apiKey = "AIzaSyD0ebZ2sxXHZyR8KwXtpoCaM4poSd3Ukpk"

    static let scheme = "https"
    static let host = "maps.googleapis.com"
    static let textPlaceSearch = "/maps/api/place/textsearch/json"
    static let nearbySearch = "/maps/api/place/nearbysearch/json"
    static let placeDetails = "/maps/api/place/details/json"

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PlaceDetails")
    static let defaultRankby: String = "prominence"
    static let defaultRadius: Int32 = 100
    static let isOpenNow: Bool = true
    
}
