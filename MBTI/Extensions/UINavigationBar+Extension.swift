//
//   UINavigationBar+Extension.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/15/25.
//

import UIKit

extension UINavigationBar {
    static func configureAppearange() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.clear]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black
    }
}
