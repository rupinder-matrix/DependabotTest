//
//  ItemListControl.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 30/11/23.
//

import UIKit
import AdopshunSDK

class ItemListControl: UIViewController {
    
    @IBOutlet weak var tblVw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tblVw.delegate = self
        tblVw.dataSource = self
        tblVw.register(UINib(nibName: "ItemListCell", bundle: nil), forCellReuseIdentifier: "ItemListCell")
        if selectedUserId == "101" {
            ScreenDataGetter.shared.addSegmentData(segmentId: 42, authToken: "PK_dfHwKdr9faH77gH4Tgs4rnAMKabzHBuMcgP", segmentData: ["user_id": "101"]) { userData, messageData in
                print("segment data",userData, messageData)
                ScreenDataGetter.shared.showOnboarding(userID: "101")
                
            }
        } else if selectedUserId == "102" {
            ScreenDataGetter.shared.showOnboarding(userID: "102")
        } else {
            ScreenDataGetter.shared.showOnboarding(userID: "")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cartAction(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartControl") as? CartControl
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        logout()
    }
    
}

extension ItemListControl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListCell") as! ItemListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ItemDetailControl") as? ItemDetailControl
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
