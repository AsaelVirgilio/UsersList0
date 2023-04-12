//
//  ViewModelCell.swift
//  MVP1
//
//  Created by Asael Virgilio on 10/04/23.
//

import Foundation

class ViewModelCell{
    
    var name, mail, username: String
    
    init(user: User? = nil) {
        self.name = user?.name ?? ""
        self.mail = user?.email ?? ""
        self.username = user?.username ?? ""
    }
//    func getIndex(indexPath: IndexPath) -> in{
//        indexPath.row
//    }
}
