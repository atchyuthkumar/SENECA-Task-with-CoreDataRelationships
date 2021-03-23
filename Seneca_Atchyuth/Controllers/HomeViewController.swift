//
//  ViewController.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 19/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Outlet Connections
    @IBOutlet weak var usersTableView: UITableView!
    
    // Variable Definitions
    var userData_array = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Getting user data
        self.fetchUserDetails()
    }
    
    //MARK:- Functions
    
    func fetchUserDetails()  {
        let endpoint_Str = "https://reqres.in/api/users?page=1"
        Webservices.sharedInstance.getAPI(API_String: endpoint_Str, target: self) { [weak self] (data) in
            switch Webservices.sharedInstance.responseStatus {
            case.success:
                if let response_data = data as? [String: Any], let userdata = response_data["data"] as? [[String: Any]] {
                    
                    #if DEBUG
                    print("userdata", userdata)
                    #endif
                    
                    for user in userdata {
                        self?.userData_array.append(UserModel(userDictionary: user))
                    }
                    
                    DispatchQueue.main.async {
                        // reload the tableview
                        self?.usersTableView.reloadData()
                    }
                }
            case.error:
                // Display internet connection alert
                print("error")
            case.nill:
                // Display internet connection alert
                print("Null data")
            }
        }
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let userCell = tableView.dequeueReusableCell(withIdentifier: "UserTVCell") as? UserTVCell {
            userCell.userdata = self.userData_array[indexPath.row]
            return userCell
        }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

