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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
       
    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        ClassFunctions.createClass(classModel: ClassModel(title: classTextField.text!))
        
        if let doneSaving = doneSaving{
            doneSaving()
        }
        dismiss(animated: true)
        
    }
    
}
