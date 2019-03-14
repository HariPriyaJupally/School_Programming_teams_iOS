//
//  TeamsTableViewController.swift
//  School Programming Teams
//
//  Created by Jupally,Hari Priya on 3/13/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    var school: School!
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return school.teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teams", for: indexPath)
        cell.textLabel?.text = school.teams[indexPath.row].name
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = school.name
        tableView.reloadData()
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Team Details"{
            let studentsVC = segue.destination as! StudentsViewController
            studentsVC.team = school.teams[tableView.indexPathForSelectedRow!.row]
        }
        else if segue.identifier == "New Team"{
            let newTeamsVC = segue.destination as! NewTeamViewController
            newTeamsVC.school = school
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            school.teams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
