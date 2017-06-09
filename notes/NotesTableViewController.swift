//
//  NotesTableViewController.swift
//  notes
//
//  Created by Zulwiyoza Putra on 6/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class NotesTableViewController: MainTableViewController {
    
    @IBAction func addNote(_ sender: Any) {
        
        let note = Note(text: "New Note", context: fetchedResultsController!.managedObjectContext)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let note = fetchedResultsController?.object(at: indexPath) as! Note
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note's Cell", for: indexPath)
        cell.textLabel?.text = note.text
        cell.detailTextLabel?.text = note.formattedDate
        return cell
    }
}


