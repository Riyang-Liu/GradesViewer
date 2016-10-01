//
//  AllCoursesTableViewController.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/20/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import UIKit

//The master view controller which displays all the classes that the college provides.
class AllCoursesTableViewController: UITableViewController {
    
    //Variables
    let searchController = UISearchController(searchResultsController: nil)
    
    var courseData:[CourseData] = []
    var allCourseData:[CourseData] = []
    var filteredCourses = [CourseData]()

    override func viewDidLoad() {
        super.viewDidLoad()

    //Preparing all the course data.
        courseData = GradeDistribution(courseData: GradeDistributionService().jsonResultArray).noneDuplicatedDataArray
        allCourseData = GradeDistribution(courseData: GradeDistributionService().jsonResultArray).courseDataArray
     
    //Adding a search bar on the top of the table view.
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search a course"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searchController.active && searchController.searchBar.text != "" {
            return filteredCourses.count
        }
        
        return courseData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AllCourses", forIndexPath: indexPath)
        
        let course: CourseData
        
        if searchController.active && searchController.searchBar.text != "" {
            course = filteredCourses[indexPath.row]
        } else {
            course = courseData[indexPath.row]
        }
        
        cell.textLabel?.text = course.course

        return cell
    }
    
    //Transfering all the data from the master view controller to the detail view controller.
    //Letting the detail master view know which course that the user want to check.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Grades" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                        let object: CourseData
                
                        if searchController.active && searchController.searchBar.text != "" {
                            
                            object = filteredCourses[indexPath.row]
                            
                        } else {
                            
                            object = courseData[indexPath.row]
                            
                        }
                        
                        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! GradesTableViewController
                        controller.courseDataTransation = object
                        controller.allCourseDataTransation = allCourseData
                        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                        controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    

    //Searching the text that the user types in.
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCourses = courseData.filter { CourseData in
            return CourseData.course!.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}


//An extension file that supports the Search bar.
extension AllCoursesTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}