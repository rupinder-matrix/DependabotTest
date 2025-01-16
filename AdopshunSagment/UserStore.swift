//
//  UserStore.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 30/11/23.
//

import Foundation

class UserStore {
    
    static let shared = UserStore()
    
    
    //Current user's id
    var isPopedUpOpened:Bool{
        get{
            return UserDefaults.standard.value(forKey: "isPopedUpOpened") as? Bool ?? false
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "isPopedUpOpened")
        }
    }
    
}
