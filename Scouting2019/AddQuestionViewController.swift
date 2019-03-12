import UIKit

class AddQuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionPicker: UIPickerView!
    @IBOutlet weak var questionName: UITextField!
    
    let documentInteractionController = UIDocumentInteractionController()
    let questionList = ["Large Text Box", "Slider", "Small Text Box", "Switch", "Stepper", "Line Break"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionPicker.delegate = self
        questionPicker.dataSource = self
    }
    
    // Picker View Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questionList[row]
    }

    @IBAction func backToDesign(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "backToDesign", sender: self)
    }
}
