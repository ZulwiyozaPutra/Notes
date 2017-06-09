//
//  NotebookTableViewController.swift
//  notes
//
//  Created by Zulwiyoza Putra on 6/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NotebookTableViewController: MainTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "Notes"
        
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

extension NotebookTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notebook = fetchedResultsController!.object(at: indexPath) as! Notebook
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notebook's Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = notebook.name
        cell.detailTextLabel?.text = "\(notebook.notes!.count) notes"
        return cell
    }
}
