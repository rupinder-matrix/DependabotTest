//
//  ItemDetailControl.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 01/12/23.
//

import UIKit
import AdopshunSDK

class ItemDetailControl: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedUserId == "101" {
            ScreenDataGetter.shared.showOnboarding(userID: "101")
        } else if selectedUserId == "102" {
            ScreenDataGetter.shared.showOnboarding(userID: "102")
            //            ScreenDataGetter.shared.addSegmentData(segmentId: 42, authToken: "PK_dfHwKdr9faH77gH4Tgs4rnAMKabzHBuMcP", segmentData: ["user_id": "101"]) { userData, messageData in
            //                print("segment data",userData, messageData)
            //            }
        } else {
            ScreenDataGetter.shared.showOnboarding(userID: "")
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        logout()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension UIViewController{
    func logout(){
        let refreshAlert = UIAlertController(title: "Logout", message: "Do you want to logout?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Logout", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            ScreenDataGetter.shared.resetData()
            guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
                return
            }
            let navigationController = UINavigationController(rootViewController: rootVC)
            
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
}
