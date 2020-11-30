//
//  MenuController.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 26.11.2020.
//

import UIKit

protocol MenuTextDelegate: class {
    func update(_ text: String)
}

class MenuController: UITableViewController, UINavigationControllerDelegate {
    
    let menuItems = ["1 Пункт Меню", "2 Пункт Меню", "3 Пункт Меню", "4 Пункт Меню", "5 Пункт Меню"]
    let customColor = UIColor(red: 49/255, green: 57/255, blue: 60/255, alpha: 1)
    weak var menuTextDelegate: MenuTextDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Private functions
    private func setupTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "reuseIdentifier")
        tableView.backgroundColor = customColor
        tableView.separatorColor = UIColor.white
        self.modalPresentationStyle = .fullScreen
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.backgroundColor = customColor
        cell.textLabel?.textColor = UIColor.white

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = String(indexPath.row + 1)
        menuTextDelegate?.update(index)
        dismiss(animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
