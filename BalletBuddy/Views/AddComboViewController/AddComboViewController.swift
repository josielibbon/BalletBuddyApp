//
//  AddComboViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit
class AddComboViewController: UIViewController{

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleTextField:UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var cancel: AppButton!
    @IBOutlet weak var save: AppButton!
    
    
    
    
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
       
    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        titleTextField.rightViewMode = .never
        
        guard titleTextField.text != "", let _ = titleTextField.text else {
            titleTextField.layer.borderColor = UIColor.red.cgColor
            titleTextField.layer.borderWidth = 1
            titleTextField.layer.cornerRadius = 5
            titleTextField.rightViewMode = .always
            return
        }
        
       // guard titleTextField.text != "", let newComboName = titleTextField.text else{
      //      return
      //  }
       // if let index = comboIndexToEdit {
       //     ClassFunctions.updateCombo(at: index, title: newComboName)
      //  }
      //  else{
      //      ClassFunctions.createCombo(classModel: ClassModel(title: titleTextField.text!))
     //   }
         
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
        
    }
    

  

}
