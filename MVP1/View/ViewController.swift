//
//  ViewController.swift
//  MVP1
//
//  Created by Asael Virgilio on 10/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = Presenter()
    var users: [ViewModelCell] = []
    
    var cellViewModel: ViewModelCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
        
        configView()
        
    }
    
    func configView(){
        
        self.title = "Main View"
        setupTableView()
        
    }
}

extension ViewController: PresenterDelegate{
    func presentUsers(users: [ViewModelCell]) {
        self.users = users
        self.reloadTableView()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    
}
