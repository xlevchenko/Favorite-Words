//
//  UIApplication + Extension.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/27/23.
//

import Foundation
import UIKit

extension UIApplication {

    func setRootController(_ vc : UIViewController?){
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let mainWindow = windowScene.windows.first {
            mainWindow.rootViewController = vc
            mainWindow.makeKeyAndVisible()
        }
    }
 }
