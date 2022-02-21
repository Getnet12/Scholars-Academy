//
//  signInViewController.swift
//  Scholars Academy
//
//  Created by Getnet Mekuriyaw on 2/20/22.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "onLogin", sender: self)
            }
        }
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
