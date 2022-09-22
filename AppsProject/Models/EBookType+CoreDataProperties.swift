//
//  EBookType+CoreDataProperties.swift
//  AppsProject
//
//  Created by LookiiMobile on 21/9/2022.
//
//

import Foundation
import CoreData


extension EBookType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EBookType> {
        return NSFetchRequest<EBookType>(entityName: "EBookType")
    }

    @NSManaged public var typename: String?
    @NSManaged public var electronicbooks: NSSet?

}

// MARK: Generated accessors for electronicbooks
extension EBookType {

    @objc(addElectronicbooksObject:)
    @NSManaged public func addToElectronicbooks(_ value: ElecronicBook)

    @objc(removeElectronicbooksObject:)
    @NSManaged public func removeFromElectronicbooks(_ value: ElecronicBook)

    @objc(addElectronicbooks:)
    @NSManaged public func addToElectronicbooks(_ values: NSSet)

    @objc(removeElectronicbooks:)
    @NSManaged public func removeFromElectronicbooks(_ values: NSSet)

}

extension EBookType : Identifiable {

}
