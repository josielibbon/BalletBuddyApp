//
//  ClassViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import UIKit

class ClassViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
        override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        ClassFunctions.readClass(completion: { [weak self] in
            self?.tableView.reloadData()
        })
            view.backgroundColor = Theme.background
            addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddClassSegue"{
            let popup = segue.destination as! AddClassViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
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
    
    
}
