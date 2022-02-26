//
//  ClockInAndOutVC.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 22/02/2022.
//

import UIKit

class ClockInAndOutVC: UIViewController {

    var selectedSheet: String?
    @IBOutlet weak var clockInButton: UIButton!
    @IBOutlet weak var clockOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func onClockIn(_ sender: Any) {
        performSegue(withIdentifier: "CicoSegue", sender: self.clockInButton)
    }
    
    @IBAction func onClockOut(_ sender: Any) {
        performSegue(withIdentifier: "CicoSegue", sender: self.clockOutButton)
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let studentListVC = segue.destination as! StudentListVC
        let btnType = sender as! UIButton
        if(btnType.tag == 0){
            studentListVC.isClockingOut = false
        }else{
            studentListVC.isClockingOut = true
        }
        studentListVC.selectedSheet = self.selectedSheet
        
    }
    

}
