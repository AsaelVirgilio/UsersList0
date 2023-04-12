//
//  Presenter.swift
//  MVP1
//
//  Created by Asael Virgilio on 10/04/23.
//

import Foundation
import UIKit

protocol PresenterDelegate: AnyObject{
    func presentUsers(users: [ViewModelCell])
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegateView = PresenterDelegate & UIViewController

class Presenter{
    weak var delegate: PresenterDelegate?
    var users: [User] = []
    var cellDataSource: [ViewModelCell] = []
    
    func getUsers(){
        let network = NetworkConnection()
        network.getInfo { [weak self] arrUsers in
            self?.users = arrUsers
            self?.mapCellData()
        }
    }
    
    func setViewDelegate(delegate: PresenterDelegateView){
        self.delegate = delegate
    }
    
    func tapCellTable(index: IndexPath){
        delegate?.presentAlert(title: cellDataSource[index.row].username, message: cellDataSource[index.row].mail)
    }
    
    func mapCellData(){
        self.cellDataSource = self.users.compactMap({ViewModelCell(user: $0)})
        delegate?.presentUsers(users: cellDataSource)
    }
    
//    func getNumberRows() -> Int{
//        self.users.count
//    }
    
}
