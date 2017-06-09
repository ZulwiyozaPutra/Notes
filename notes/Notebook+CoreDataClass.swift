//
//  Notebook+CoreDataClass.swift
//  notes
//
//  Created by Zulwiyoza Putra on 6/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import CoreData


public class Notebook: NSManagedObject {

    convenience init(name: String, context: NSManagedObjectContext) {
        
        if let notebook = NSEntityDescription.entity(forEntityName: "Notebook", in: context) {
            self.init(entity: notebook, insertInto: context)
            self.name = name
            self.date = Date()
        } else {
            fatalError("Unable to find 'Notebook' entity")
        }
    }
    
    var formattedDate: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .short
            dateFormatter.doesRelativeDateFormatting = true
            dateFormatter.locale = Locale.current
            return dateFormatter.string(from: date!)
        } 
    }
}
