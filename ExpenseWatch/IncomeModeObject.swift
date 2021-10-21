//
//  IncomeModeObject.swift
//  ExpenseWatch
//
//  Created by Ioannis Karagogos on 17/5/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit

class IncomeModeObject: NSObject, NSCoding {
    
    var mode : Bool
    
    init(mode: Bool){
        self.mode = mode
    }

    required convenience init?(coder decoder: NSCoder)
    {
        let mode = decoder.decodeBool(forKey: "mode")
        self.init(
            mode: mode
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.mode, forKey:"mode")
    }
    
}
