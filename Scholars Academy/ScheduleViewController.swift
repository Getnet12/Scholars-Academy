//
//  ScheduleViewController.swift
//  Scholars Academy
//
//  Created by Getnet Mekuriyaw on 2/20/22.
//

import UIKit
import Firebase

class ScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true 
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            // to got back the root view controller
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print("Error signing out: @ ", signOutError)
        }
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
