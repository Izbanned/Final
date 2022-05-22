//
//  SettingsViewController.swift
//  Final
//
//  Created by Dias Karimov on 22.05.2022.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = user?.email
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func deletePressed(_ sender: UIButton) {
        user?.delete { error in
          if let error = error {
            print("Error")
          } else {
            print("Success")
          }
        }
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    

}
