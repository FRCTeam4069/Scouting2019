//
//  QuestionElements.swift
//  Scouting2019
//
//  Created by Aidan Zerwer on 2019-02-11.
//  Copyright © 2019 4069. All rights reserved.
//

import UIKit

// Global way to store responses as they change across classes
class Responses {
    var responseDict = [:] as [String : Any]
}
var responses = Responses()

protocol CellTemplate {
    func reset()
}

// Label cell class
class LabelCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
}
extension CellTemplate where Self: LabelCell {func reset() {}}

// Switch cell class
class SwitchCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var elementSwitch: UISwitch!
    @IBAction func switchValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = elementSwitch.isOn
    }
}
extension CellTemplate where Self: SwitchCell {
    func reset() {
        elementSwitch.setOn(false, animated: false)
        responses.responseDict[title.text!] = elementSwitch.isOn
    }
}

// Blank cell class
class BlankCell: UITableViewCell, CellTemplate {}
extension CellTemplate where Self: BlankCell {func reset(){}}

// Small text cell class
class SmallTextCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var smallTextField: UITextField!
    @IBAction func textEditingDidEnd(_ sender: Any) {
        responses.responseDict[title.text!] = smallTextField.text
    }
}
extension CellTemplate where Self: SmallTextCell {
    func reset() {
        smallTextField.text = ""
        responses.responseDict[title.text!] = smallTextField.text
    }
}

// Large text cell class
// Load called as init for border and delegate
// Delegate used to call when editing changed
class LargeTextCell: UITableViewCell, UITextViewDelegate, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var largeTextField: UITextView!
    
    func load() {
        largeTextField.delegate = self
        largeTextField.layer.borderColor = UIColor.lightGray.cgColor
        largeTextField.layer.borderWidth = 1
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        responses.responseDict[title.text!] = largeTextField.text
    }
}
extension CellTemplate where Self: LargeTextCell {
    func reset() {
        largeTextField.text = ""
        responses.responseDict[title.text!] = largeTextField.text
    }
}

// Stepper cell class
// Stepper label updated when value change to display value
class StepperCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValueLabel: UILabel!
    
    @IBAction func StepperValueChanged(_ sender: UIStepper) {
        stepperValueLabel.text = String(Int(stepper.value))
        responses.responseDict[title.text!] = String(Int(stepper.value))
    }
}
extension CellTemplate where Self: StepperCell {
    func reset() {
        stepper.value = 0
        responses.responseDict[title.text!] = String(Int(stepper.value))
    }
}

// Number cell class
// Same as small text cell but uses a number keyboard
class NumberCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func numberEditingDidEnd(_ sender: Any) {
        responses.responseDict[title.text!] = numberField.text
    }
}
extension CellTemplate where Self: NumberCell {
    func reset() {
        numberField.text = ""
        responses.responseDict[title.text!] = numberField.text
    }
}

// Segment cell with two segments class
class DoubleSegmentCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var doubleSegment: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = doubleSegment.titleForSegment(at: doubleSegment.selectedSegmentIndex)
    }
}
extension CellTemplate where Self: DoubleSegmentCell {
    func reset() {
        doubleSegment.selectedSegmentIndex = 0
        responses.responseDict[title.text!] = doubleSegment.titleForSegment(at: doubleSegment.selectedSegmentIndex)
    }
}

// Segment cell with three segments class
class TripleSegmentCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tripleSegment: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = tripleSegment.titleForSegment(at: tripleSegment.selectedSegmentIndex)
    }
}
extension CellTemplate where Self: TripleSegmentCell {
    func reset() {
        tripleSegment.selectedSegmentIndex = 0
        responses.responseDict[title.text!] = tripleSegment.titleForSegment(at: tripleSegment.selectedSegmentIndex)
    }
}

// Segment cell with four segments class
class QuadrupleSegmentCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var quadrupleSegment: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = quadrupleSegment.titleForSegment(at: quadrupleSegment.selectedSegmentIndex)
    }
}
extension CellTemplate where Self: QuadrupleSegmentCell {
    func reset() {
        quadrupleSegment.selectedSegmentIndex = 0
        responses.responseDict[title.text!] = quadrupleSegment.titleForSegment(at: quadrupleSegment.selectedSegmentIndex)
    }
}

class QuintupleSegmentCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var quintupleSegment: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = quintupleSegment.titleForSegment(at: quintupleSegment.selectedSegmentIndex)
    }
}
extension CellTemplate where Self: QuintupleSegmentCell {
    func reset() {
        quintupleSegment.selectedSegmentIndex = 0
        responses.responseDict[title.text!] = quintupleSegment.titleForSegment(at: quintupleSegment.selectedSegmentIndex)
    }
}

// Slider cell class
class SliderCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderValueChanged(_ sender: Any) {
        responses.responseDict[title.text!] = String(Int(slider.value))
    }
}
extension CellTemplate where Self: SliderCell {
    func reset() {
        slider.value = 0
        responses.responseDict[title.text!] = String(Int(slider.value))
    }
}

// Drawing cell class
class DrawingCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView! // Image used as the background
    @IBOutlet weak var currentLine: UIImageView! // Image used to store current line
    @IBOutlet weak var view: UIView!
    
    var backgroundImg: UIImage! // Used to store background in event of clear
    var lastPoint = CGPoint.zero // Last point stored for drawing line
    var color = UIColor.green
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    // Resets both backgroundImage and currentLine to backgroundImg
    @IBAction func clearButton(_ sender: Any) {
        backgroundImage.image = backgroundImg
        currentLine.image = backgroundImg
        // Save to responses as base64 string
        responses.responseDict[title.text!] = backgroundImg.jpegData(compressionQuality: 0.5)?.base64EncodedString()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        (self.superview as! UITableView).isScrollEnabled = false
        swiped = false
        lastPoint = touch.location(in: view)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        currentLine.image?.draw(in: self.bounds)
        
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        
        currentLine.image = UIGraphicsGetImageFromCurrentImageContext()
        currentLine.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        //(self.superview?.superclass as! designTableView).cellTable.isScrollEnabled = false
        swiped = true
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
    
        UIGraphicsBeginImageContext(backgroundImage.frame.size)
        backgroundImage.image?.draw(in: backgroundImage.bounds, blendMode: .normal, alpha: 1.0)
        currentLine.image?.draw(in: backgroundImage.bounds, blendMode: .normal, alpha: opacity)
        backgroundImage.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        currentLine.image = nil
        (self.superview as! UITableView).isScrollEnabled = true
        responses.responseDict[title.text!] = backgroundImage.image?.jpegData(compressionQuality: 0.5)?.base64EncodedString()
    }
}
extension CellTemplate where Self: DrawingCell {
    func reset() {
        backgroundImage.image = backgroundImg
        currentLine.image = backgroundImg
        responses.responseDict[title.text!] = ""
    }
}

// Image cell class
class ImageCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var displayedImage: UIImageView!
    @IBOutlet weak var title: UILabel!
}
extension CellTemplate where Self: ImageCell {func reset(){}}

// Smaller label cell (sub title cell) class
class SubTitleCell: UITableViewCell, CellTemplate {
    @IBOutlet weak var title: UILabel!
}
extension CellTemplate where Self: SubTitleCell {func reset(){}}

// Function used to take NSDictionary of a cells data and convert to UITableViewCell
func cellConfig(cellData: NSDictionary, cellTable: UITableView) -> UITableViewCell {
    
    // Take import info
    let cellName = cellData["Name"] as? String
    let cellType = cellData["Type"] as! String
    
    // Case for each type of cell
    // Sets initial values
    // Saves initial value to responses
    if cellType == "switchCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
        cell.title?.text = cellName
        responses.responseDict.updateValue(cell.elementSwitch.isOn, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "blankCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "blankCell") as! BlankCell
        return cell
    }
    else if cellType == "labelCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "labelCell") as! LabelCell
        cell.title?.text = cellName
        return cell
    }
    else if cellType == "smallTextCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "smallTextCell") as! SmallTextCell
        cell.title?.text = cellName
        responses.responseDict.updateValue(cell.smallTextField.text!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "largeTextCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "largeTextCell") as! LargeTextCell
        cell.load()
        cell.title?.text = cellName
        responses.responseDict.updateValue(cell.largeTextField.text!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "stepperCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "stepperCell") as! StepperCell
        cell.title?.text = cellName
        responses.responseDict.updateValue(String(cell.stepper.value), forKey: cell.title.text!)
        return cell
    }
    else if cellType == "numberCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "numberCell") as! NumberCell
        cell.title?.text = cellName
    
        responses.responseDict.updateValue(cell.numberField.text!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "doubleSegmentCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "doubleSegmentCell") as! DoubleSegmentCell
        cell.title?.text = cellName
        cell.doubleSegment.setTitle(cellData["SegmentNameOne"] as? String, forSegmentAt: 0)
        cell.doubleSegment.setTitle(cellData["SegmentNameTwo"] as? String, forSegmentAt: 1)
        responses.responseDict.updateValue(cell.doubleSegment.titleForSegment(at: cell.doubleSegment.selectedSegmentIndex)!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "tripleSegmentCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "tripleSegmentCell") as! TripleSegmentCell
        cell.title?.text = cellName
        cell.tripleSegment.setTitle(cellData["SegmentNameOne"] as? String, forSegmentAt: 0)
        cell.tripleSegment.setTitle(cellData["SegmentNameTwo"] as? String, forSegmentAt: 1)
        cell.tripleSegment.setTitle(cellData["SegmentNameThree"] as? String, forSegmentAt: 2)
        responses.responseDict.updateValue(cell.tripleSegment.titleForSegment(at: cell.tripleSegment.selectedSegmentIndex)!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "quadrupleSegmentCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "quadrupleSegmentCell") as! QuadrupleSegmentCell
        cell.title?.text = cellName
        cell.quadrupleSegment.setTitle(cellData["SegmentNameOne"] as? String, forSegmentAt: 0)
        cell.quadrupleSegment.setTitle(cellData["SegmentNameTwo"] as? String, forSegmentAt: 1)
        cell.quadrupleSegment.setTitle(cellData["SegmentNameThree"] as? String, forSegmentAt: 2)
        cell.quadrupleSegment.setTitle(cellData["SegmentNameFour"] as? String, forSegmentAt: 3)
        responses.responseDict.updateValue(cell.quadrupleSegment.titleForSegment(at: cell.quadrupleSegment.selectedSegmentIndex)!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "quintupleSegmentCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "quintupleSegmentCell") as! QuintupleSegmentCell
        cell.title?.text = cellName
        cell.quintupleSegment.setTitle(cellData["SegmentNameOne"] as? String, forSegmentAt: 0)
        cell.quintupleSegment.setTitle(cellData["SegmentNameTwo"] as? String, forSegmentAt: 1)
        cell.quintupleSegment.setTitle(cellData["SegmentNameThree"] as? String, forSegmentAt: 2)
        cell.quintupleSegment.setTitle(cellData["SegmentNameFour"] as? String, forSegmentAt: 3)
        cell.quintupleSegment.setTitle(cellData["SegmentNameFive"] as? String, forSegmentAt: 4)
        responses.responseDict.updateValue(cell.quintupleSegment.titleForSegment(at: cell.quintupleSegment.selectedSegmentIndex)!, forKey: cell.title.text!)
        return cell
    }
    else if cellType == "sliderCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "sliderCell") as! SliderCell
        cell.title?.text = cellName
        cell.slider.minimumValue = Float(cellData["Minimum"] as! String)!
        cell.slider.maximumValue = Float(cellData["Maximum"] as! String)!
        //cell.slider.value = Float(cellData["Value"] as! String)!
        responses.responseDict.updateValue(String(Int(cell.slider.value)), forKey: cell.title.text!)
        return cell
    }
    else if cellType == "subTitleCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "subTitleCell") as! SubTitleCell
        cell.title?.text = cellName
        return cell
    }
    else if cellType == "drawingCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "drawingCell") as! DrawingCell
        let imageData = Data(base64Encoded: cellData["BackgroundImage"] as! String)
        cell.backgroundImage.image = UIImage(data: imageData!)
        cell.currentLine.image = UIImage(data: imageData!)
        cell.backgroundImg = cell.backgroundImage.image // Do this for scaling
        cell.title?.text = cellName
        responses.responseDict[cell.title.text!] = cellData["BackgroundImage"]
        return cell
    }
    else if cellType == "imageCell" {
        let cell = cellTable.dequeueReusableCell(withIdentifier: "imageCell") as! ImageCell
        let imageData = Data(base64Encoded: cellData["Image"] as! String)
        cell.displayedImage.image = UIImage(data: imageData!)
        cell.title?.text = cellName
        return cell
    }
    return cellTable.dequeueReusableCell(withIdentifier: "blankCell") as! BlankCell
}

