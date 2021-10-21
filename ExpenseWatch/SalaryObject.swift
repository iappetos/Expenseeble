//
//  SalaryObject.swift
//  ExpenseWatch
//
//  Created by planB on 12/5/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit

class SalaryObject: NSObject, NSCoding {
    
    var income : Double?
    var salaryFilePath : String? = ""
    
    init(income: Double? = nil, salaryFilePath : String? = nil){
        self.income = income
        self.salaryFilePath = salaryFilePath
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.income, forKey:"income")
        aCoder.encode(self.salaryFilePath, forKey:"salaryFilePath")
        //let filePath = decoder.decodeObject(forKey: "filePath") as? String
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let income = aDecoder.decodeObject(forKey: "income") as? Double
        let salaryFilePath = aDecoder.decodeObject(forKey: "salaryFilePath") as? String
        self.init(
            income: income,
            salaryFilePath : salaryFilePath
        )
    }
    
    

}
