//
//  WordsTableViewController.swift
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController, UISearchBarDelegate, UITextFieldDelegate {

    @IBOutlet var searchBar: UISearchBar!
    
    var wordList : [String] {
        get {
            var results = NSUserDefaults.standardUserDefaults().objectForKey("wordList") as [String]?
            if results == nil {
                results = []
            }
            return results!
        }
        set (newValue) {
            let val = newValue as [NSString]
            NSUserDefaults.standardUserDefaults().setObject(val, forKey: "wordList")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure Delete Button
        self.tableView.allowsMultipleSelectionDuringEditing = false;
        
        // Configure Search Bar
        self.searchBar.delegate = self
        self.searchBar.returnKeyType = UIReturnKeyType.Done
        
        // Remove the icon, which is located in the left view
        AppearanceBridger.setUITextFieldAppearance()
        
        // Give some left padding between the edge of the search bar and the text the user enters
        self.searchBar.searchTextPositionAdjustment = UIOffsetMake(10, 0);
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {

        
        if let word = self.searchBar.text {
            println(word)
            
            if UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(word) {
            
                self.wordList.insert(word, atIndex: 0)
                self.tableView.reloadData()
            
                searchBar.text = ""
            
                // Dismiss the search bar
                searchBar.resignFirstResponder()
            } else {
                
                // Configure Alert
                let alertController = UIAlertController(title: "WordBank", message: "\(word) Not Found", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                
                // Show Alert
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }

        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return wordList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = wordList[indexPath.row]
        
        
        // Configure the cell...

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.wordList.removeAtIndex(indexPath.row)
            
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dictionary = UIReferenceLibraryViewController(term: self.wordList[indexPath.row])
        
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
