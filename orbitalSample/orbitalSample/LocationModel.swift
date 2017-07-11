//
//  LocationModel.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/22/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import UIKit

class LocationModel: NSObject {
    //properties
    
    var locationId: String?
    var diagram: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    
    init(locationId: String, diagram: String) {
        
        self.locationId = locationId
        self.diagram = diagram

        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Location Id: \(locationId!), Diagram: \(diagram!)"
        
    }

}
