//
//  UserDetaislViewController.swift
//  Seneca_Atchyuth
//
//  Created by Smscountry on 19/03/21.
//

import UIKit

@available(iOS 13.0, *)
class UserDetaislViewController: UIViewController {

    // Outlet Connections
    @IBOutlet weak var useDetailTableView: UITableView!
    
    //Variable Definitions
    let mainContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var user_detail_array = [Users]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.user_detail_array = CoreDataManger.sharedinstance.fetchRecors()
        
        if (self.user_detail_array.count > 0) {
            
        } else {
            self.getUserInformation()
        }
         
    }
    
    //MARK:- FUNCTIONS
    
    func getUserInformation() {
        let endpoint_Str = "https://jsonplaceholder.typicode.com/users"
        Webservices.sharedInstance.getAPI(API_String: endpoint_Str, target: self) { [weak self] (data) in
            switch Webservices.sharedInstance.responseStatus {
            case.success:
                if let response_data = data as? [[String: Any]] {
                  
                    #if DEBUG
                    print("userdetails", response_data)
                    #endif
                    
                    self?.callCoredat(user_data: response_data)
                    
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
    
    func callCoredat(user_data: [[String: Any]])  {
        DispatchQueue.main.async {
            for user_datail in user_data {
                let mainContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                var email = String()
                var company = String()
                var catchphrase = String()
                var city = String()
                if let userEmail = user_datail["email"] as? String {
                    email = userEmail
                }
                if let userAddress = user_datail["address"] as? [String: Any], let cityname = userAddress["city"] as? String {
                    city = cityname
                }
                if let usercompany = user_datail["company"] as? [String: Any], let companyName = usercompany["name"] as? String, let catchPhrase = usercompany["catchPhrase"] as? String {
                    company = companyName
                    catchphrase = catchPhrase
                }
                let userrecord = Users(context: mainContext)
                userrecord.email = email
                let companyRecord = Company(context: mainContext)
                 companyRecord.companyName = company
                 companyRecord.cathphrase = catchphrase
                let addressRecord = Address(context: mainContext)
                 addressRecord.city = city
                userrecord.toAddress = addressRecord
                userrecord.toCompany = companyRecord
                do {
                    // Saving data into coredata
                try mainContext.save()
                } catch {
                    print("save error is \(error.localizedDescription)")
                }
            }
                self.user_detail_array = CoreDataManger.sharedinstance.fetchRecors()
                self.useDetailTableView.reloadData()
        }
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension UserDetaislViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user_detail_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let user_detail_cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell") as? UserDetailTableViewCell {
            user_detail_cell.user_detail_record = self.user_detail_array[indexPath.row]
            return user_detail_cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
