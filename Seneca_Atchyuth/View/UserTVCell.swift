//
//  UserTVCell.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 19/03/21.
//

import UIKit

class UserTVCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var userMailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var userdata: UserModel? {
        didSet {
          
            self.downloadFrom(avatar_str: self.userdata?.avatarString ?? "")
            self.firstNameLabel.text = userdata?.firstName
            self.lastNameLabel.text = userdata?.lastName
            self.userMailLabel.text = userdata?.email
            
        }
    }
    
    func downloadFrom(avatar_str: String?) {
        if avatar_str == nil {
            self.userImage.image = UIImage(named: "default")
            return
        }
        
        if let url = NSURL(string: avatar_str!) {
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, _, error) -> Void in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self.userImage.image = UIImage(data: data)
                }
            }).resume()
        } else {
            self.userImage.image = UIImage(named: "default")
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


