//
//  ViewController.swift
//  Final
//
//  Created by Dias Karimov on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Yes", message: "My best guess", preferredStyle: .alert)
        let actionDefault = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(actionDefault)
         present(alert, animated: true)
    }
    
}

