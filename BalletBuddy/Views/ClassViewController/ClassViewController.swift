//
//  ClassViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import UIKit

class ClassViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var helpView: UIVisualEffectView!
    @IBOutlet weak var addButton: UIButton!
    
    var classIndexToEdit: Int?
    var seenClassHelp = "seenClassHelp"
        override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ClassFunctions.readClass(completion: { [unowned self] in
            self.tableView.reloadData()
            
            if Data.classModels.count > 0{
                if UserDefaults.standard.bool(forKey: self.seenClassHelp) == false{
                    view.addSubview(self.helpView)
                    self.helpView.frame = self.view.bounds
                }
            }
        })
        
            
            
            view.backgroundColor = Theme.background
            addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddClassSegue"{
            let popup = segue.destination as! AddClassViewController
            popup.classIndexToEdit = self.classIndexToEdit
            popup.doneSaving = { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            classIndexToEdit = nil
        }
    }
    
    @IBAction func closeHelpView(_ sender: AppButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenClassHelp)
        }
    }
}

extension ClassViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.classModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ClassTableViewCell
        
        
        cell.setup(classModel: Data.classModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let classes = Data.classModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            let alert = UIAlertController(title: "Delete Class", message: "Are you sure you want to delete this class: \(classes.title)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in actionPerformed(false)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in //Perform delete
            ClassFunctions.deleteClass(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
        }))
        
        self.present(alert, animated: true)
        }
        
        delete.image = #imageLiteral(resourceName: "baseline_clear_white_18dp")
        return UISwipeActionsConfiguration(actions: [delete])
    }
        func tableView(_ tableView: UITableView,
            leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let edit = UIContextualAction(style: .normal, title: "Edit")
            {   (contextualAction, view, actionPerformed: (Bool) -> ()) in
                self.classIndexToEdit = indexPath.row
                self.performSegue(withIdentifier: "toAddClassSegue", sender: nil)
                actionPerformed(true)
            }
        
            edit.image = #imageLiteral(resourceName: "baseline_edit_white_18dp")
            edit.backgroundColor = UIColor(named: "EditColor")
        
        
        return UISwipeActionsConfiguration(actions: [edit])
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classes = Data.classModels[indexPath.row]
        let vc = ComboViewController.getInstance() as! ComboViewController
        vc.classesId = classes.id
        vc.classTitle = classes.title
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
