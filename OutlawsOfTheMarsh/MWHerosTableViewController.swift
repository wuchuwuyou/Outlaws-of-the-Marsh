//
//  MWHerosTableViewController.swift
//  OutlawsOfTheMarsh
//
//  Created by Tiny on 15/5/13.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

class MWHerosTableViewController: UITableViewController,UISearchControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate {
    
    //    @IBOutlet var searchDisplayController:UISearchDisplayController
    
    var dataArray:NSArray = []
    var searchArray:NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.queryHerosData()
    }
    
    func queryHerosData() {
        self.dataArray =  MWHerosManager().dataSource()
        self.tableView.reloadData()
    }
    
    func searchHerosData(key:String)->NSArray{
        var predicate = NSPredicate(format: "name CONTAINS %@ or nick CONTAINS %@ or order = %@", key,key,key)
        self.searchArray = self.dataArray .filteredArrayUsingPredicate(predicate)
        return self.searchArray
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
        if tableView == self.tableView{
            
            return self.dataArray.count
            
        }
        
        return self.searchArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("heroCell", forIndexPath: indexPath) as! UITableViewCell
            

            let data: MWHerosData = self.dataArray.objectAtIndex(indexPath.row) as! MWHerosData
            
            cell.textLabel?.text = data.name
            
            cell.detailTextLabel!.text = data.nick
            
            return cell
        
        }
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        let data: MWHerosData = self.searchArray.objectAtIndex(indexPath.row) as! MWHerosData
        
        cell.textLabel?.text = data.name
        
        cell.detailTextLabel?.text = data.nick
        
        return cell
    
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 44
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        var detailVC: MWHerosDetailViewController! = storyboard.instantiateViewControllerWithIdentifier("herosDetailViewController") as! MWHerosDetailViewController

        if tableView == self.tableView {
            
            detailVC.data = self.dataArray.objectAtIndex(indexPath.row) as? MWHerosData
            
        }else {
            
            detailVC.data = self.searchArray.objectAtIndex(indexPath.row) as? MWHerosData
            
        }
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
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
    
    
    // MARK: - UISearchDisplayController delegate methods
    
//    var search:UISearchController
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.searchHerosData(searchString)
        return true
    }
//    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
//        self.searchHerosData(self.searchDisplayController?.searchBar.text)
//        return true
//    }
    
//    -(BOOL)searchDisplayController:(UISearchDisplayController *)controller  shouldReloadTableForSearchString:(NSString *)searchString {
//    
//    [self filterContentForSearchText:searchString                                 scope:[[self.searchDisplayController.searchBar scopeButtonTitles]                                       objectAtIndex:[self.searchDisplayController.searchBar                                                      selectedScopeButtonIndex]]];
//    
//    return YES;
//    
//    }
//    
//    - (BOOL)searchDisplayController:(UISearchDisplayController *)controller  shouldReloadTableForSearchScope:(NSInteger)searchOption {
//    
//    [self filterContentForSearchText:[self.searchDisplayController.searchBar text]                                 scope:[[self.searchDisplayController.searchBar scopeButtonTitles]                                       objectAtIndex:searchOption]];
//    
//    return YES;
//    
//    }
}
