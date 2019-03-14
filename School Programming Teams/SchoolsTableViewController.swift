//
//  SchoolsTableViewController.swift
//  School Programming Teams
//
//  Created by Jupally,Hari Priya on 3/13/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class SchoolsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Schools.shared.numSchools()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schools")
        cell?.textLabel?.text = Schools.shared[indexPath.row].name
        cell?.detailTextLabel?.text = "\(Schools.shared[indexPath.row].coach)"
        return cell!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "School Details"{
            let schoolDetailsVC = segue.destination as! TeamsTableViewController
            schoolDetailsVC.school = Schools.shared[tableView.indexPathForSelectedRow!.row]
        }
        
}
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Schools.shared.delete(school: Schools.shared[indexPath.row] )
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
