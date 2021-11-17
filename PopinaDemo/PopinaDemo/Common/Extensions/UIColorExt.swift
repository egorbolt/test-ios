//
//  UIColorExt.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        var h = hex
        if (h.hasPrefix("#")) {
            h.remove(at: h.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: h).scanHexInt64(&rgb)
        
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
