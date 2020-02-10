import UIKit
import Firebase
import FirebaseFirestore

class DesignTableView: UITableViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet var cellTable: UITableView!
    
    var cellData = NSArray() // NSArray of NSDictionaries storing questions
    var cells = [UITableViewCell]() // Array of all cells
    var db: Firestore!
    var formName = ""
    
    // Button for submitting response
    @IBAction func submitButton(_ sender: Any) {
        // Add timestamp yyy-MM-dd HH:mm
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // Add FormName
        responses.responseDict.updateValue(self.formName, forKey: "FormName")
        // Add timestamp
        responses.responseDict.updateValue(formatter.string(from: Date()), forKey: "Timestamp")
        // Add response
        db.collection("response").addDocument(data: responses.responseDict)
        loadDatabase()
        // Perform Segue
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exitButton(_ sender: Any) {
        loadDatabase()
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadDatabase() {
        let count = self.cells.count
        self.cells.removeAll()
        self.cellData = NSArray()
        self.cellTable.deleteRows(at: (0..<count).map { i in IndexPath(row: i, section: 0) }, with: .automatic)

        self.cellTable.reloadData()
        
        // Init firestore
        Firestore.firestore().settings = FirestoreSettings()
        db = Firestore.firestore()
        
        // Asynchronous query for selected form in "forms" collection
        self.db.collection("forms").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // Check if form is select form
                    if((document.data()["Name"]! as? String)! == self.formName) {
                        // Set cellData to data in selected form
                        self.cellData = (document.data()["Data"])! as! NSArray
                    }
                }
                
                // Empty responses
                responses.responseDict = [:]
                
                // Create UITableViewCell from cellConfig function for each cell in cellData
                for cell in self.cellData {
                    let x = cellConfig(cellData: cell as! NSDictionary, cellTable: self.cellTable)
                    (x as! CellTemplate).reset()
                    self.cells.append(x)
                }
                
                // Reload table
                self.cellTable.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround() // Init hidden keyboard

        // Init formName from default saved selected form
        formName = UserDefaults.standard.string(forKey: "selectedForm")!
        navigationBar.title = formName
        loadDatabase()
    }
    
    // Uses size of cells array of UITableViewCells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    // Uses cells array of UITableViewCells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    // Returns the required cell size for special cells (see storyboard cell sizes)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (cellData[indexPath.row] as! NSDictionary)["Type"] as! String == "largeTextCell" {
            return 176
        }
        else if (cellData[indexPath.row] as! NSDictionary)["Type"] as! String == "drawingCell" {
            return 338
        }
        else if (cellData[indexPath.row] as! NSDictionary)["Type"] as! String == "imageCell" {
            return 338
        }
        return 44
    }
}
