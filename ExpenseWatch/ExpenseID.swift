//
//  ExpenseID.swift
//  ExpenseWatch
//
//  Created by planB on 15/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit

class ExpenseID: NSObject, NSCoding {
    
    
    var nextID: Int?
    
    init(nextID: Int? = nil ){
        self.nextID = nextID
    }
    
    
    required convenience init?(coder decoder: NSCoder)
    {
        let nextID = decoder.decodeObject(forKey: "nextID") as? Int
        self.init(
            nextID: nextID
        )
    }
    
    
    
    func encode(with coder: NSCoder) {
        coder.encode(self.nextID, forKey:"nextID")
           }
        
}
