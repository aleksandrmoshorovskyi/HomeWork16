//
//  UIColor+Ext.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 19.04.2024.
//

import UIKit

extension UIColor {
    
    func isLight() -> Bool {
            
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
            
        getRed(&r, green: &g, blue: &b, alpha: &a)
            
        let brightness = ((r * 299) + (g * 587) + (b * 114)) / 1_000
            
        return brightness >= 0.5
    }
    
    static func getColorFor(RGB:(red: Int, green: Int, blue: Int)) -> UIColor {
        
        let red: CGFloat = CGFloat(RGB.red) / 255.0
        let green: CGFloat = CGFloat(RGB.green) / 255.0
        let blue: CGFloat = CGFloat(RGB.blue) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func random() -> UIColor {
        
        let red: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        let green: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        let blue: CGFloat = CGFloat(Int.random(in: 0...255)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
