//
//  BaseViewController.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/13/25.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController, UIConfigurable {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureView() {
        view.backgroundColor = .dalkomWhite
    }
}

