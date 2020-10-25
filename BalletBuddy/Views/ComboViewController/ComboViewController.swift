//
//  ComboViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit

class ComboViewController: UIViewController {

    var classesId: UUID!
    var classModel: ClassModel?
    var sectionHeaderHeight: CGFloat = 0.0
    var classTitle = ""
    var doneSaving: ((StepModel) -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: AppButton!
    
    fileprivate func UpdateTableViewWithClassData() {
        ClassFunctions.readClass(by: classesId)  { [weak self] (model) in
            guard let self = self else { return }
            self.classModel = model
            
            guard model != nil else { return }
            
            self.tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.createFloatingActionButton()
        title = classTitle
        tableView.dataSource = self
        tableView.delegate = self
        
        UpdateTableViewWithClassData()
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "headerCell")?.contentView.bounds.height ?? 0
    }
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addButton(_ sender: AppButton) {
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        let comboAction = UIAlertAction(title: "Combination", style: .default, handler: handleAddCombo)
        
        let stepAction = UIAlertAction(title: "Step", style: .default, handler: handleAddStep)
            
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        stepAction.isEnabled = classModel!.comboModels.count > 0
        
        alert.addAction(comboAction)
        alert.addAction(stepAction)
        alert.addAction(cancel)
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.width)
        
        present(alert, animated: true)
        
        }
    
    
    fileprivate func getClassIndex() -> Array<ClassModel>.Index? {
        return Data.classModels.firstIndex(where: { (classModel) -> Bool in
            classModel.id == classesId
        })
    }
    
    func handleAddStep(action: UIAlertAction) {
        let vc = AddStepViewController.getInstance() as! AddStepViewController
        vc.classModel = classModel
        vc.classIndex = getClassIndex()
        vc.doneSaving = { [weak self] comboIndex, stepModel in
            guard let self = self else { return }
            
            let row = (self.classModel?.comboModels[comboIndex].stepModels.count)! - 1
            self.classModel?.comboModels[comboIndex].stepModels.append(stepModel)
            let indexPath = IndexPath(row: row, section: comboIndex)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        present(vc, animated: true)
    }
    
    
    func handleAddCombo(action: UIAlertAction) {
        let vc = AddComboViewController.getInstance() as! AddComboViewController
        vc.classIndex = getClassIndex()
        vc.doneSaving = { [weak self] comboModel in
            guard let self = self else { return }
            
            let indexArray = [self.classModel?.comboModels.count ?? 0]
            self.classModel?.comboModels.append(comboModel)
            self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
        }
        
        present(vc, animated: true)
    }
    }


extension ComboViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return classModel?.comboModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {        
        return sectionHeaderHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let comboModel = classModel?.comboModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        cell.setup(model: comboModel!)
        return cell.contentView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classModel?.comboModels[section].stepModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = classModel?.comboModels[indexPath.section].stepModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StepsTableViewCell
 
        cell.setup(model: model!)
        
        return cell
    }
    
    
}
