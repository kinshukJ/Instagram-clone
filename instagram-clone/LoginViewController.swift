//
//  LoginViewController.swift
//  instagram-clone
//
//  Created by Kinshuk Juneja on 3/12/17.
//  Copyright © 2017 CS490. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func unwindToLoginViewController (segue: UIStoryboardSegue) {
    }
  
    @IBAction func loginUser(_ sender: UIButton) {
        let userName = self.userNameField.text ?? ""
        let password = self.passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: userName, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Error", message:
                    "Username Password mismatch", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
