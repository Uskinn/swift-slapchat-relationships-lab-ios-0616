//
//  TableViewController.swift
//  SlapChat
//
//  Created by Flatiron School on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    var managedMessageObjects: [Message] = []
    let store: DataStore = DataStore()
    var recipientMessage: Set<Message> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedMessageObjects = Array(recipientMessage)
        store.fetchRecipientData()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        store.fetchRecipientData()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.managedMessageObjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        let eachMessage = self.managedMessageObjects[indexPath.row]
        cell.textLabel?.text = eachMessage.content
        return cell
    }
}