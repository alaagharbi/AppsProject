//
//  ElecronicBook+CoreDataProperties.swift
//  AppsProject
//
//  Created by LookiiMobile on 21/9/2022.
//
//

import Foundation
import CoreData


extension ElecronicBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElecronicBook> {
        return NSFetchRequest<ElecronicBook>(entityName: "ElecronicBook")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var progess: String?
    @NSManaged public var ebookdescription: String?
    @NSManaged public var ebooktype: EBookType?

}

extension ElecronicBook : Identifiable {

}
