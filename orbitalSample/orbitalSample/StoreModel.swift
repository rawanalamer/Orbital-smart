//
//  StoreModel.swift
//  orbitalSample
//
//  Created by Rawan Alamer on 6/4/17.
//  Copyright © 2017 orbitalstaff. All rights reserved.
//

import Foundation

class StoreModel: NSObject {
    
    //properties
    
    var name: String?
    var unit: String?
    var opening: String?
    var website: String?
    var number: String?
    var descrp: String?
    var diagram: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(name: String, unit: String, opening: String, website: String, number: String, descrp: String, diagram: String) {
        
        self.name = name
        self.unit = unit
        self.opening = opening
        self.website = website
        self.number = number
        self.descrp = descrp
        self.diagram = diagram
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(name), Unit: \(unit), Opening Hours: \(opening), Webisite: \(website), Number: \(number), Description: \(descrp), Diagram: \(diagram)"
        
    }

}
