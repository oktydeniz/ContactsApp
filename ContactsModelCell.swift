//
//  ContactsModelCell.swift
//  Directory
//
//  Created by oktay on 26.02.2023.
//

import UIKit

class ContactsModelCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
