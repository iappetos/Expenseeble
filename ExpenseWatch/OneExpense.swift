//
//  OneExpense.swift
//  ExpenseWatch
//
//  Created by planB on 2/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit

class OneExpense: NSObject, NSCoding {
    
    var size : Double?
    var cash : Bool
    var date : Date
    var kind : String? = ""
    var note : String? = ""
    var expenseID : Int?
    var filePath : String? = ""
    
    
    init(size: Double? = nil, cash: Bool, date: Date, kind: String?, note : String? = nil, expenseID : Int?, filePath : String? = nil){
        self.size = size
        self.cash = cash
        self.date = date
        self.kind = kind
        self.note = note
        self.expenseID = expenseID
        self.filePath = filePath
    }
    
    required convenience init?(coder decoder: NSCoder)
    {
        let size = decoder.decodeObject(forKey: "size") as? Double
        let cash = decoder.decodeBool(forKey: "cash")
        let date = decoder.decodeObject(forKey: "date") as? Date
        let kind = decoder.decodeObject(forKey: "kind") as? String
        let note = decoder.decodeObject(forKey: "note") as? String
        let expenseID = decoder.decodeObject(forKey: "expenseID") as? Int
        let filePath = decoder.decodeObject(forKey: "filePath") as? String
        self.init(
            size: size,
            cash: cash,
            date: date!,
            kind: kind!,
            note: note!,
            expenseID: expenseID!,
            filePath: filePath!
        )
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(self.size, forKey:"size")
        coder.encode(self.cash, forKey:"cash")
        coder.encode(self.date, forKey:"date")
        coder.encode(self.kind, forKey:"kind")
        coder.encode(self.note, forKey:"note")
        coder.encode(self.expenseID, forKey:"expenseID")
        coder.encode(self.filePath, forKey:"filePath")
    }
    
    
    
    
    
    
    
    
    
}

