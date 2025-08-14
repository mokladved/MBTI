//
//  UIButton+Extension.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/14/25.
//

import UIKit

extension UIButton.Configuration {
    static func dalkomStyle(
        title: String,
        fontSize: CGFloat = 15,
        fontWeight: UIFont.Weight = .bold,
        bgColor: UIColor = .gray,
        fgColor: UIColor = .black)
    -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = bgColor
        config.baseForegroundColor = fgColor
        config.cornerStyle = .capsule
        
        var attributedTitle = AttributedString(title)
        attributedTitle.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        config.attributedTitle = attributedTitle
        
        return config
    }
}
