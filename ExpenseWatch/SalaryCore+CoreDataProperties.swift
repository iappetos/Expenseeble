//
//  SalaryCore+CoreDataProperties.swift
//  ExpenseWatch
//
//  Created by planB on 7/12/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//
//

import Foundation
import CoreData


extension SalaryCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SalaryCore> {
        return NSFetchRequest<SalaryCore>(entityName: "SalaryCore")
    }

    @NSManaged public var sizeOfSalaryCore: Double

}
