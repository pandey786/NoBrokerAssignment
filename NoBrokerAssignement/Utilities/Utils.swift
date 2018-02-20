//
//  Utils.swift
//  NoBrokerAssignement
//
//  Created by Durgesh Pandey on 19/02/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

func customizeNavigationBar() {
    
    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.tintColor = uicolorFromHex(rgbValue: 0xffffff)
    navigationBarAppearace.barTintColor = uicolorFromHex(rgbValue: 0xF91B42)
    navigationBarAppearace.barStyle = .black
    navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
}

func uicolorFromHex(rgbValue:UInt32) -> UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:1.0)
}


