//
//  LocationService.swift
//  GetGoingClass
//
//  Created by Alla Bondarenko on 2019-01-30.
//  Copyright © 2019 SMU. All rights reserved.
//

import Foundation
import CoreLocation

class FilterService: NSObject {
    
    // singleton
    static let shared = FilterService()
    
    // MARK: - Properties
    
    //var locationManager: CLLocationManager?
    weak var delegate: FilterServiceDelegate?
    
    private override init() {
        super.init()
        
        
        }
}

// Custom protocol
protocol FilterServiceDelegate: class {
    func setFilterValues(radius: Int32?, rankby: String?, isOpen: Bool?)
    func getSetFilterValues() -> (Int32, String, Bool)
}


