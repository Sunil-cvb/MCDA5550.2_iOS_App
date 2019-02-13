//
//  DetailsViewController.swift
//  GetGoingClass
//
//  Created by MCDA on 2019-02-05.
//  Copyright © 2019 SMU. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
   
    var place: PlaceDetails!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        self.getRequestDetails()
        hideActivityIndicator()
        // Do any additional setup after loading the view.
    }
    
    func showActivityIndicator(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func getRequestDetails(){
        GooglePlacesAPI.requestPlaceInfo(place) { (status, json) in
            print(json ?? "")
            DispatchQueue.main.async {
                self.hideActivityIndicator()
            }

            guard let result = json!["result"] as! NSDictionary? else { return }
            
            self.presentLocationInfo(json: result as NSDictionary)
            
        }
    }
    
    func presentErrorAlert(title: String = "Error", message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okButtonAction = UIAlertAction(title: "Ok",
                                           style: .default,
                                           handler: nil)
        alert.addAction(okButtonAction)
        present(alert, animated: true)
    }
    
    func presentLocationInfo(json: NSDictionary) {
        
        DispatchQueue.main.async {
            
            self.setPhoneNumber(json: json)
            self.setWebsite(json: json)
            
        }
    }
    
    func setPhoneNumber(json: NSDictionary){
        guard let phoneNumber = json["formatted_phone_number"] as! String? else {
            self.phoneLabel.text = "No Phone Number Registered."
            
            return}
        self.phoneLabel.text = phoneNumber
    }
    
    func setWebsite(json: NSDictionary){
        guard let website = json["website"] as! String? else {
            self.websiteLabel.text = "No Website Registered."
            return}
        self.websiteLabel.text = website
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
