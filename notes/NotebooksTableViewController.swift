//
//  NotebooksTableViewController.swift
//  notes
//
//  Created by Zulwiyoza Putra on 6/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NotebooksTableViewController: MainTableViewController {
    
    @IBAction func addNotebook(_ sender: Any) {
        let notebook = Notebook(name: "New Notebook", context: fetchedResultsController!.managedObjectContext)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "Notebook"
        
        // Get the stack from AppDelegate
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fecth request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notebook")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "date", ascending: false)]
        
        // Create a fetch request controller
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
}

extension NotebooksTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notebook = fetchedResultsController!.object(at: indexPath) as! Notebook
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notebook's Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = notebook.name
        cell.detailTextLabel?.text = "\(notebook.notes!.count) notes"
        return cell
    }
}

extension NotebooksTableViewController {
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Displaying Note" {
            if let notesTableViewController = segue.destination as? NotesTableViewController {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
                fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false), NSSortDescriptor(key: "text", ascending: true)]
                let indexPath = tableView.indexPathForSelectedRow!
                let notebook = self.fetchedResultsController?.object(at: indexPath)
                let predicate = NSPredicate(format: "notebook = %@", argumentArray: [notebook!])
                fetchRequest.predicate = predicate
                let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.fetchedResultsController!.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
                notesTableViewController.fetchedResultsController = fetchedResultsController
            }
        }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    

}
