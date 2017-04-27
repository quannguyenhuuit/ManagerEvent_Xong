//
//  ManagerEventTableViewController.swift
//  ManagerEvent_Quan
//
//  Created by quanmacos on 4/27/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import UIKit

class ManagerEventTableViewController: UITableViewController {

    
    // Data Source
    lazy var eventLines: [EventLine] = {
        return EventLine.eventLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tao button Edit
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //So ngay trong 1 tuan trong View
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return eventLines.count
    }
    
    //Tong su kien trong 1 ngay
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let eventLine = eventLines[section]
        return eventLine.events.count
    }
    
    //Mark Default Header Section
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     let eventLine = eventLines[section]
     return eventLine.dates // the number of each day
     }*/
    
    
    
    // Do du lieu vao Table View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        //Xac dinh ngay hien tai
        let eventLine = eventLines[indexPath.section]
        
        //Xac dinh dong hien tai
        let event = eventLine.events[indexPath.row]
        
        //Hien thi ten va chi tiet su kien
        cell.textLabel?.text = event.title
        cell.detailTextLabel?.text = event.description
       
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    //Thao tac khi nguoi dung xoa 1 su kien
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let eventLine = eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic
            )
        } else if editingStyle == .insert {
        }
    }
    
    //Di chuyen thu tu cac su kien
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let evenLine = eventLines[sourceIndexPath.section];
        let event = evenLine.events[sourceIndexPath.row];
        
        evenLine.events.remove(at: sourceIndexPath.row)
        
        let evenLineDes = eventLines[destinationIndexPath.section];
        evenLineDes.events.insert(event, at: destinationIndexPath.row);
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation
    
    // Ham dieu huong sang View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if (segue.identifier == "EventDetail") {
            
            let eventDetailVC = segue.destination as! EventDetailTableViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                eventDetailVC.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateEvent = dateAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateImages = imageAtIndexPath(indexPath: indexPath as NSIndexPath)
            }
            
        }
        
        
    }
    
    //Dua event vao IndexPath
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event{
        let eventLine = eventLines[indexPath.section]
        return eventLine.events[indexPath.row]
    }
    
    //Dua ngay vao IndexPath
    func dateAtIndexPath(indexPath: NSIndexPath) -> String{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dates
    }
    
  //Dua hinh anh vao IndexPath
    func imageAtIndexPath(indexPath: NSIndexPath) -> UIImage{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dateImages
    }
}
