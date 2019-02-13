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
    var resultData = NSDictionary()
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        requestPlaceInfo()
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
    
    func requestPlaceInfo() {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        urlComponents.path = Constants.placeInfo
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: Constants.apiKey),
            URLQueryItem(name: "placeid", value: "\(place.place_id!)")
        ]
        
        if let url = urlComponents.url {
            NetworkingLayer.getRequest(with: url, timeoutInterval: 1000) { (status, data) in
                if let responseData = data,
                    let jsonResponse = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [String: Any] {
                    print("printing jsonResponse DATA")
                       guard let self.resultData = jsonResponse!["result"] as! NSDictionary else{
                        DispatchQueue.main.async {
                            self.phoneLabel.text = "no phone number found"
                            self.websiteLabel.text = "no website details found"
                        }
                          return
                       }
                        self.presentLocationInfo()
                }
            }
        }
    }
}
    
    func presentLocationInfo(){
        print(self.resultData)
        DispatchQueue.main.async {
            
            if self.resultData["formatted_phone_number"] == nil{
            self.phoneLabel.text = "No Phone Number Registered."
            }
            else
            {
                self.phoneLabel.text = self.resultData["formatted_phone_number"]! as? String
            }
            if self.resultData["website"] == nil{
                self.websiteLabel.text = "No Website found."
            }
            else
            {
                self.websiteLabel.text = self.resultData["website"]! as? String
            }
            
        }
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
