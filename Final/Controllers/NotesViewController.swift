//
//  NotesViewController.swift
//  Final
//
//  Created by Dias Karimov on 21.05.2022.
//

import UIKit
import RealmSwift
import FirebaseAuth

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    var noteItems: Results<Note>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        load()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItems?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let note = noteItems?[indexPath.row] {
            cell.textLabel?.text = note.title
        } else {
            cell.textLabel?.text = "No Notes"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let note = noteItems?[indexPath.row] {
            do {
                try realm.write({
                    realm.delete(note)
                })
            } catch {
                print("Delete error => \(error)")
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new note", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add note", style: .default) {
            (action) in
            
            let newNote = Note()
            newNote.title = textField.text!
            
            do {
                try self.realm.write({
                    self.realm.add(newNote)
                })
            } catch {
                print("Add error => \(error)")
            }
            self.tableView.reloadData()
        }
        alert.addTextField { (actionTextField) in
            actionTextField.placeholder = "New Note"
            textField = actionTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    func load() {
         noteItems = realm.objects(Note.self)
        
        tableView.reloadData()
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
