//
//  SceneDelegate.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 30/11/23.
//

import UIKit
import AdopshunSDK
import Adopshun_Creater

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if UserStore.shared.isPopedUpOpened == true  {
            ScreenDataGetter.shared.getRender(application: UIApplication.shared)
            ScreenDataGetter.shared.objScreenDataGetterDelegate = self
        }
        AdopshunCreator.shared.addCreateorButton(application: UIApplication.shared)
        AdopshunCreator.shared.objAdopshunCreatorDelegate = self
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if !UserStore.shared.isPopedUpOpened {
            let alert = UIAlertController(title: "Adopshun", message: "Do you want to show Onboarding", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: { (action: UIAlertAction!) in
                DataManager.shared.isOpenPermissionPopup = 1
                DataManager.shared.isPermissionForOnboarding = true
                UserStore.shared.isPopedUpOpened = true
//                ScreenDataGetter.shared.getRender(application: UIApplication.shared)
                ScreenDataGetter.shared.objScreenDataGetterDelegate = self
//                ScreenDataGetter.shared.showOnboarding(userID: "")
            }))
            
            alert.addAction(UIAlertAction(title: "Don't Allow", style: .cancel, handler: { (action: UIAlertAction!) in
                DataManager.shared.isOpenPermissionPopup = 0
                DataManager.shared.isPermissionForOnboarding = false
                UserStore.shared.isPopedUpOpened = true
            }))
            
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate:AdopshunCreatorDelegate{
    func willPresentScreen(viewController: UIViewController) {
        //        self.window?.rootViewController?.present(viewController, animated: true)
        topMostController().present(viewController, animated: true)
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
}
extension SceneDelegate:ScreenDataGetterDelegate{
    func willPresentController(viewController: UIViewController) {
        //self.window?.rootViewController?.present(viewController, animated: true)
        topMostController().present(viewController, animated: true)
    }
    
}

