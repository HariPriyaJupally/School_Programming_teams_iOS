//
//  AddNewSchoolViewController.swift
//  School Programming Teams
//
//  Created by Jupally,Hari Priya on 3/13/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class NewSchoolViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var coachTF: UITextField!
    
    var newSchool: School!
    
    @IBAction func doneBTN(_ sender: Any) {
        let name = nameTF.text!
        let coach = coachTF.text!
        Schools.shared.add(school: School(name: name, coach: coach))
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
