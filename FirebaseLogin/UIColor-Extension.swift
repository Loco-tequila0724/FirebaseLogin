//
//  UIColor-Extension.swift
//  LoginWithFirebaseApp
//
//  Created by 日高隼人 on 2021/02/14.
//

import UIKit

extension UIColor {

    static func rgb(red: CGFloat,green: CGFloat, blue: CGFloat) -> UIColor{
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha:1)

    }

}



