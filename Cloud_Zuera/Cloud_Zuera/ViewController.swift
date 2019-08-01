//
//  ViewController.swift
//  Cloud_Zuera
//
//  Created by Victor Dângelo Teixeira Ciccarini on 01/08/19.
//  Copyright © 2019 Victor Dângelo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }


}

