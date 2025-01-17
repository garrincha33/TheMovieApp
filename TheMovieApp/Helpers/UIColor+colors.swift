//
//  UIColor+colors.swift
//  TheMovieApp
//
//  Created by Richard Price on 03/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
