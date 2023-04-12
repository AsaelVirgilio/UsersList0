//
//  UserTableViewCell.swift
//  MVP1
//
//  Created by Asael Virgilio on 10/04/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public static var identifier: String{
        get{
            return "userCell"
        }
    }
    
    public static func registerCell() -> UINib{
        UINib(nibName: "UserTableViewCell", bundle: nil)
    }
    
    func setUpCell(viewModel: ViewModelCell){
        mailLabel.text = viewModel.mail
        userLabel.text = viewModel.username
        nameLabel.text = viewModel.name
    }
    
}
