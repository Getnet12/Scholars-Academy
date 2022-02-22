//
//  SignInSheetVC.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 21/02/2022.
//

import UIKit

class SheetsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var availableSheets = ["LSAMP", "Tutoring", "Mentoring"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return availableSheets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SheetCell", for: indexPath) as! SheetCell
        
        cell.sheetTitle.text = availableSheets[indexPath.row]
        cell.view.layer.cornerRadius = 20
        return cell
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
