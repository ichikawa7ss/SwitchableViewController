//
//  UIView+.swift
//  SwitchableViewController
//
//  Created by ichikawa on 2020/10/31.
//  Copyright © 2020 ichikawa. All rights reserved.
//

import UIKit

// MARK: - IBInspectable
extension UIView {
 
    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            // 0.5などの小数第一位が5の値が入った場合、レンダリングの倍率によって描画される線の太さにブレが出る
            // https://qiita.com/koogawa/items/c91f53cc4cb8a59978b4
            let scale = UIScreen.main.scale
            layer.borderWidth = round( newValue * scale ) / scale
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
