import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UITableViewController {
    
    let defaults = UserDefaults.standard; // Defaults used to save selected form
    var cells = [String]() // Array of cell names
    var db: Firestore!
    
    // Current table
    @IBOutlet var cellTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init hidden keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Setup database
        Firestore.firestore().settings = FirestoreSettings()
        db = Firestore.firestore()
        
        // Initial load
        reloadForms()
    }
    
    // Uses cells array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    // Creates buttonCell from cells array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "buttonCell") as! ButtonCell
        cell.button.setTitle(cells[indexPath.row], for: .normal)
        return cell
    }
    
    // Asynchronous query appends all form names from "form" collection to cells array and then reload table
    func reloadForms() {
        db.collection("forms").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.cells = [String]()
                for document in querySnapshot!.documents {
                    self.cells.append((document.data()["Name"]! as? String)!)
                }
                
                // Reload table
                self.cellTable.reloadData()
            }
        }
    }
    
    // Refresh button
    @IBAction func syncButton(_ sender: UIBarButtonItem) {
        reloadForms()
    }
}

// Cell for each form button displayed
class ButtonCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonAction(_ sender: Any) {
        // Defaults save selected form
        UserDefaults.standard.set(button.currentTitle!, forKey: "selectedForm")
    }
}

// When screen is tapped keyboard is dismissed
// When keyboard is open it covers screen preventing keyboard of closing on touches
// Must be called in viewDidLoad to use
extension UITableViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
