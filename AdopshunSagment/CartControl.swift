//
//  CartControl.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 30/11/23.
//

import UIKit
import AdopshunSDK

class CartControl: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        if selectedUserId == "101" {
            ScreenDataGetter.shared.showOnboarding(userID: "101")
        } else if selectedUserId == "102" {
            ScreenDataGetter.shared.addSegmentData(segmentId: 62, authToken: "PK_dfHwKdr9faH77gH4Tgs4rnAMKabzHBuMcgP", segmentData: ["user_id": "102"]) { userData, messageData in
                print("segment data", userData, messageData)
                ScreenDataGetter.shared.showOnboarding(userID: "102")
            }
        } else {
            ScreenDataGetter.shared.showOnboarding(userID: "")
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        logout()
    }
    
}
