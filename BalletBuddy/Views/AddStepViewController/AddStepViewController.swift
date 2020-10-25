//
//  StepViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit

class AddStepViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comboPickerView: UIPickerView!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var cancel: AppButton!
    @IBOutlet weak var save: AppButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    var classIndex: Int!
    var classModel: ClassModel!
    var doneSaving: ((Int, StepModel) -> ())?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        comboPickerView.dataSource = self
        comboPickerView.delegate = self
        //Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
    }
    @IBAction func save(_ sender: UIButton) {
        guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }
        let stepType: StepType = getSelectedStepType()
        
        let comboIndex = comboPickerView.selectedRow(inComponent: 0)
        
        let stepModel = StepModel(title: newTitle, subtitle: subtitleTextField.text ?? "", stepType: stepType)

        StepFunctions.createStep(at: classIndex, for: comboIndex, using: stepModel)
        
        if let doneSaving = doneSaving {
            doneSaving(comboIndex, stepModel)
        }
        
        
        dismiss(animated: true)
        
    }
    func getSelectedStepType() -> StepType {
        return .barre
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension AddStepViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classModel.comboModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classModel.comboModels[row].title
  
    }
    
}
