//
//  ViewController.swift
//  UIElements
//
//  Created by Viktoriia Jane Ro on 18.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
   /* ----- START -----  Properties and Array for UIPickerView   */
    
    var uiElements = ["UISegmentedControl",
                "UILabel",
                "UISlider",
                "UITextField",
                "UIButton",
                "UIDatePicker"]
    
    var selectedElement: String?
    
    /* ----- END -----  uiElements, selecteView in the UIPickerView   */
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider.value = 1
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        datePicker.locale = Locale(identifier: "ru_Ru")
        
        choiceUiElement()
        
        createToolbar()
    }
    
    /* ----- START ----- Functions for working with all elements in the interface in the select by UIPickerView */
    
    func choiceUiElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        // Customization
        elementPicker.backgroundColor = .systemOrange
        
    }
    
    func hideAllElements() {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
    }
    
    
    // Create new button for the dismiss of UIPickerView
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
        
        // Customization
        toolbar.tintColor = .white
        toolbar.barTintColor = .systemOrange
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /* ----- END ----- functions of UIPickerView */

    
   /* ----- START -----  This element shows selected item and text of this selected item */
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Something is wrong!")
        }
        
    }
   
    /* ----- END -----  choiceSegment in the UISegmentedControl */
    
    /* ----- START -----  This element shows level of transparency of the all screen */
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
        
    }
 
    /* ----- END -----  sliderAction in the UISlider */
    
    
    /* ----- START -----  This element interacts with UITextField and UILabel: enter data in the text field and output them in the label after click button */
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!){
            
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            
            print("Name format is wrong")
        } else {
            label.text = textField.text
            textField.text = nil
        }
            
    }
    
    /* ----- END -----  donePressed in the UIButton */
    
    
    /* ----- START -----  This element helps to select date in the UIDatePicker and after choice it shows this date in the UILabel */
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
        
    }
    /* ----- END -----  changeDate in the UIDatePicker */
    
    /* ----- START ----- This element turns off or turns on the all elements in the screen  */
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        segmentedControl.isHidden = !segmentedControl.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        doneButton.isHidden = !doneButton.isHidden
        
        
        if sender.isOn {
            
            switchLabel.text = "Отобразить все элементы"
        } else {
            switchLabel.text = "Скрыть все элементы"
        }
        
        
    }
    
}
/* ----- END ----- switchAction in the UISwitch  */

/* ----- START ----- Implementation of the logic UIPickerView */

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            segmentedControl.isHidden = false
        case 1:
            hideAllElements()
            label.isHidden = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
        case 4:
            hideAllElements()
            doneButton.isHidden = false
        case 5:
            hideAllElements()
            datePicker.isHidden = false
        default:
            hideAllElements()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
    
}

/* ----- END ----- Implementation of the logic UIPickerView */
