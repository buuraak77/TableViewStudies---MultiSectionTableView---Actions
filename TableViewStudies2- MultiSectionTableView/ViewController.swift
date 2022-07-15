//
//  ViewController.swift
//  TableViewStudies2- MultiSectionTableView
//
//  Created by Burak Yılmaz on 15.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var sections = ["Fruit", "Countries", "Animals"]
    var infos = [["Strawberry", "Pineapple", "Avocado", "Apple","Peach"],["Turkey","Italy","Argentina","Spain","France"],["Dog","Cat","Fish","Snake","Bear","Monkey","Donkey","Eagle"]]

    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TableView Studies"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addInfo))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    @objc func addInfo() {
        
        
        let firstAlert = UIAlertController(title: "Which Section Do You Want To Add", message: nil, preferredStyle: .actionSheet)
        
        let button1 = UIAlertAction(title: "\(sections[0])", style: .default) { UIAlertAction in
            
            let alert = UIAlertController(title: "Add Item To \(self.sections[0])", message: nil, preferredStyle: .alert)
            alert.addTextField()
            
            let okButton = UIKit.UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                if let info = alert.textFields![0].text {
                    self.infos[0].append(info)
                    self.tableView.reloadData()
                }
            }
            
            alert.addAction(okButton)
            self.present(alert, animated: true)
            
            
        }
        let button2 = UIAlertAction(title: "\(sections[1])", style: .default) { UIAlertAction in
            
            let alert = UIAlertController(title: "Add Item To \(self.sections[0])", message: nil, preferredStyle: .alert)
            alert.addTextField()
            
            let okButton = UIKit.UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                if let info = alert.textFields![0].text {
                    self.infos[1].append(info)
                    self.tableView.reloadData()
                }
            }
            
            alert.addAction(okButton)
            self.present(alert, animated: true)

            
            
        }
        let button3 = UIAlertAction(title: "\(sections[2])", style: .default) { UIAlertAction in
            
            let alert = UIAlertController(title: "Add Item To \(self.sections[0])", message: nil, preferredStyle: .alert)
            alert.addTextField()
            
            let okButton = UIKit.UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                if let info = alert.textFields![0].text {
                    self.infos[2].append(info)
                    self.tableView.reloadData()
                }
            }
            
            alert.addAction(okButton)
            self.present(alert, animated: true)
            
        }
        
        let button4 = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        firstAlert.addAction(button1)
        firstAlert.addAction(button2)
        firstAlert.addAction(button3)
        firstAlert.addAction(button4)
        
        present(firstAlert, animated: true)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = infos[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Choosen \(sections[indexPath.section])", message: "\(infos[indexPath.section][indexPath.row])", preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAct = UITableViewRowAction(style: .destructive, title: "Delete") { UITableViewRowAction, IndexPath in
            
            self.infos[indexPath.section].remove(at: IndexPath.row)
            self.tableView.reloadData()
            
        }
        
        return [deleteAct]
    }
    
}

