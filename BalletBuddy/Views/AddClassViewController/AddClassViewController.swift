//
//  AddClassViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import UIKit

class AddClassViewController: UIViewController {


   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var classIndexToEdit: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        //Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        
        if let index = classIndexToEdit {
            let classes = Data.classModels[index]
            classTextField.text = classes.title
            titleLabel.text = "Edit Class"
        
        }
        
       
    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        guard classTextField.hasValue, let _ = classTextField.text else { return }
        
        
        guard classTextField.text != "", let newClassName = classTextField.text else{
            return
        }
        if let index = classIndexToEdit {
            ClassFunctions.updateClass(at: index, title: newClassName)
        }
        else{
            ClassFunctions.createClass(classModel: ClassModel(title: classTextField.text!))
        }
         
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
        
    }
    
    
    
    
    
}
