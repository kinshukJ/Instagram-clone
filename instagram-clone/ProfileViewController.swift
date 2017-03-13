//
//  ProfileViewController.swift
//  instagram-clone
//
//  Created by Kinshuk Juneja on 3/12/17.
//  Copyright © 2017 CS490. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            if error != nil {
                print("Logout Unsuccessful")
            }
            else {
                print("segueinggggg")
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            }
        }
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
