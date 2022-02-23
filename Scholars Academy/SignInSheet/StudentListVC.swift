//
//  StudentListVC.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 22/02/2022.
//

import UIKit


class StudentListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var isClockingOut = false
    var studentsList = [String:Any]()
    
    @IBOutlet weak var studentsTableView: UITableView!
    
    var myKey = FirestoreKey()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(isClockingOut){
            print("isClockingOut")
        }else{
            print("isClockingIn")
        }
        
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            <#code#>
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
