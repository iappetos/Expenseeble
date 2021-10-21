//
//  ModeCore+CoreDataProperties.swift
//  ExpenseWatch
//
//  Created by planB on 7/12/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//
//

import Foundation
import CoreData


extension ModeCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModeCore> {
        return NSFetchRequest<ModeCore>(entityName: "ModeCore")
    }

    @NSManaged public var salaryOrIncome: Bool

}
