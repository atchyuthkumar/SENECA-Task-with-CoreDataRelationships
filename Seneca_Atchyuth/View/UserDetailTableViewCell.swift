//
//  UserDetailTableViewCell.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 20/03/21.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var comapnyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var user_detail_record: Users? {
        didSet {
            self.comapnyNameLabel.text = user_detail_record?.toCompany?.companyName
            self.catchPhraseLabel.text = user_detail_record?.toCompany?.cathphrase
            self.emailLabel.text = user_detail_record?.email
            self.cityNameLabel.text = user_detail_record?.toAddress?.city
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
