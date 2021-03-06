//
//  EliteString.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/15.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension String {
    var length: Int { return self.characters.count }
    
    var floatValue: Float { return (self as NSString).floatValue }
    var doubleValue: Double { return (self as NSString).doubleValue }
    var integerValue: NSInteger { return (self as NSString).integerValue }
    
    func ints() -> Double {
        if length == 0 {
            return 0
        } else {
            return (self as NSString).doubleValue
        }
    }
    
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func dateWithFormat(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}

public extension NSInteger {
    var stringValue: String { return NSNumber(value: self as Int).stringValue }
}

public extension Float {
    var stringValue: String {
        
        if isNaN { print("s1") }
        if isNormal { print("s2") }
        if isZero { print("s3") }
        if isFinite { print("s4") }
        
        return isNaN || isNormal ? "" : NSNumber(value: self as Float).stringValue
    }
}

public extension Double {
    var stringValue: String { return isNaN || isNormal ? "" : NSNumber(value: self as Double).stringValue }
    
    public func stringValue(_ fractionDigits: NSInteger) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = fractionDigits
        
        return numberFormatter.string(from: NSNumber(value: self as Double))!
    }
}

public extension UserDefaults {
    public func ss(_ ssa: Double, key: String) {
    
    }
    
}
