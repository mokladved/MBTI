//
//   UINavigationBar+Extension.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/15/25.
//

import UIKit

extension UINavigationBar {
    static func configureAppearance(isFirstScene: Bool = false) -> UINavigationBarAppearance{
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.clear]
        appearance.shadowColor = isFirstScene ? .clear : .separator
        
        return appearance
    }
}
