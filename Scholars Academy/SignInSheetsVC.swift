//
//  SignInSheetsVC.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 15/02/2022.
//

import UIKit

class SignInSheetsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var test = ["Tutor", "Mentor","LSAMP"]
    @IBOutlet weak var SignInSheetCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInSheetCollection.delegate = self
        SignInSheetCollection.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        SignInSheetCollection.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = SignInSheetCollection.dequeueReusableCell(withReuseIdentifier: "SheetCell", for: indexPath) as! SheetCell
        collectionCell.cellTitle.text = test[indexPath.row]
        collectionCell.view.layer.cornerRadius = 20
        return collectionCell
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
