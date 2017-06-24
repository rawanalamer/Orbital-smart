//
//  CarparkModel.swift
//  orbitalSample
//
//  Created by Anusree on 24/6/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation

class CarparkModel: NSObject {
    
    //properties
    
    var zone1: String?
    var diagram: String?
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    
    init(zone: String, diagram: String) {
        
        self.zone1 = zone
        self.diagram = diagram
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Zone: \(zone1), Diagram: \(diagram)"
        
    }
    
}
