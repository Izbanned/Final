//
//  ResetPasswordViewController.swift
//  Final
//
//  Created by Dias Karimov on 22.05.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let actionDefault = UIAlertAction(title: "OK", style: .default)
                alert.addAction(actionDefault)
            }
            let alert = UIAlertController(title: "Hurray", message: "A password reset email has been sent!", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            
            let actionDefault = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionDefault)
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
