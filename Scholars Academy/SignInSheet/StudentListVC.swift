//
//  StudentListVC.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 22/02/2022.
//

import UIKit
import FirebaseFirestore



class StudentListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var isClockingOut = false
    var studentsList = [[String:Any]]()
    var selectedSheet: String?
    
    var db: Firestore!
    
    @IBOutlet weak var studentsTableView: UITableView!
    
    var myKey = FirestoreKey()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        // initialized firestore settings
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        db.collection(myKey.collectionID).whereField(myKey.isStudent, isEqualTo: true).whereField("isClockedIn", isEqualTo: !(self.isClockingOut)).getDocuments() { querySnap, err in
                    if let err = err{
                        print("Error getting documents: \(err)")
                    }else{
                        let fireCollection = querySnap!.documents as NSArray
                        for doc in fireCollection{
                            if let element = (doc as AnyObject).data(){
                                self.studentsList.append(element)
                                //print("here \(element)")
                                self.studentsTableView.reloadData()
                            }
                            
                        }
                        //print("here \((fireCollection[1] as AnyObject).data())")
                    }
                }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentsTableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentCell
        let fName = studentsList[indexPath.row][myKey.firstName] as! String
        let lName = studentsList[indexPath.row][myKey.lastName] as! String
        let studentName = fName + " "+lName
//        if(self.isClockingOut){
//            cell.cicoButton.setTitle("Clock Out", for: .normal)
//        }else{
//            cell.cicoButton.setTitle("Clock In", for: .normal)
//        }
        self.isClockingOut == true ? cell.cicoButton.setTitle("Clock Out", for: .normal):cell.cicoButton.setTitle("Clock In", for: .normal)
        cell.studentId.text = studentName
        return cell
    }
    func toggleCico(ofFBDocument docID: String, into boolValue: Bool, andRemove studentToRemove: Int){
        let personRef = db.collection(myKey.collectionID).document(docID)
        
        personRef.updateData([
            myKey.isClockedIn: boolValue
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                let _ = self.studentsList.remove(at: studentToRemove)
                self.studentsTableView.reloadData()
                
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellContent = studentsList[indexPath.row]
        print("here is cell Name\(cellContent)")
        let isCurrentCiCoState = cellContent[myKey.isClockedIn] as! Bool
        let docID = cellContent[myKey.documentID] as! String
        
        toggleCico(ofFBDocument: docID, into: !isCurrentCiCoState, andRemove: indexPath.row)
        
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
