//
//  UIView+Extension.swift
//  MC3_Team8_FOX
//
//  Created by 최성희 on 2022/07/31.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get { self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}


