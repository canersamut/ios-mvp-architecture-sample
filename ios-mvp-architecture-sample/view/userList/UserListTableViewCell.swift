//
//  UserListTableViewCell.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import Foundation
import UIKit

class UserListTableViewCell: UITableViewCell {
    
    public static var identifier:String = "UserListTableViewCell"
    public static var nibName:String = "UserListTableViewCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }
    
    override func prepareForReuse() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }
    
    func configure(user:User) {
        lblName.text = user.name ?? ""
        lblUserName.text = user.username ?? ""
        lblMail.text = user.email ?? ""
        lblPhone.text = user.phone ?? ""
        lblWebsite.text = user.website ?? ""
        
    }
}
