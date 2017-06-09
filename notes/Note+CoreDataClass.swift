//
//  Note+CoreDataClass.swift
//  notes
//
//  Created by Zulwiyoza Putra on 6/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import CoreData


public class Note: NSManagedObject {
    
    convenience init(text: String = "New Note", context: NSManagedObjectContext) {
        
        if let note = NSEntityDescription.entity(forEntityName: "Note", in: context) {
            self.init(entity: note, insertInto: context)
            self.text = text
            self.date = Date()
        } else {
            fatalError("Unable to find 'Note' entity")
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
