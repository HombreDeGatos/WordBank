//
//  WordsTableViewController.swift
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var wordsArray : NSArray? = NSUserDefaults.standardUserDefaults().stringArrayForKey("wordList")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        if wordsArray == nil {
            wordsArray = NSArray(array: [])
            defaults.setObject(wordsArray, forKey: "wordList")
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func wordAdded (sender : UIButton!) {
        
        println("here2")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        wordsArray = defaults.stringArrayForKey("wordList")
        println(wordsArray?.count)
        
        tableView.deselectRowAtIndexPath(NSIndexPath(index: 0), animated: true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        // + 1 for static Add Word Cell
        return (wordsArray?.count ?? 0) + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("addWordCell", forIndexPath: indexPath) as AddWordTableViewCell
            
//            var bgColorView = UIView()
//            bgColorView.backgroundColor = UIColor.whiteColor()
//            cell.selectedBackgroundView = bgColorView
            
            cell.addButton.addTarget(cell, action: "wordAdded:", forControlEvents: UIControlEvents.TouchUpInside)
            cell.addButton.addTarget(self, action: "wordAdded:", forControlEvents: UIControlEvents.TouchUpInside)
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath) as UITableViewCell
            
            cell.textLabel?.text = self.wordsArray?[indexPath.row - 1] as? String
        
            return cell
        }
        
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as AddWordTableViewCell
            cell.labelView.hidden = true
            cell.textField.becomeFirstResponder()
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row == 0 {
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as AddWordTableViewCell
            cell.textField.resignFirstResponder()
            cell.labelView.hidden = false
            
        }

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
