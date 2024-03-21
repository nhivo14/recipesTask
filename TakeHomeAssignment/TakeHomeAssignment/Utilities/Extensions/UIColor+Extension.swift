//
//  ColorConstants.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import UIKit

extension UIColor {
    // MARK: - Colors
    static let textBackgroundColor = UIColor(hexString: "38475B", alpha: 0.3)
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var mHexTring = hexString
        if hexString.replacingOccurrences(of: "#",
                                          with: "",
                                          options: NSString.CompareOptions.literal,
                                          range: nil).count != 6 {
            mHexTring = "#1D89DA"
        }
        var hexFormatted: String = mHexTring.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
