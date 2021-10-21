//
//  ExpenseCore+CoreDataProperties.swift
//  ExpenseWatch
//
//  Created by planB on 5/12/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//
//

import Foundation
import CoreData


extension ExpenseCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseCore> {
        return NSFetchRequest<ExpenseCore>(entityName: "ExpenseCore")
    }

    @NSManaged public var cash: Bool
    @NSManaged public var date: NSDate?
    @NSManaged public var kind: String?
    @NSManaged public var note: String?
    @NSManaged public var size: Double

}
