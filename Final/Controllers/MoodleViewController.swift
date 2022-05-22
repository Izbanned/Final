//
//  MoodleViewController.swift
//  Final
//
//  Created by Dias Karimov on 21.05.2022.
//

import UIKit
import WebKit

class MoodleViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://moodle.astanait.edu.kz")
                       let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
       
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
