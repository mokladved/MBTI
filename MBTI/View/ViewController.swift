//
//  ViewController.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/13/25.
//

import UIKit

class ViewController: BaseViewController {
    
    let startButton = {
        let button = UIButton()
        button.configuration = .dalkomStyle(
            title: Constants.UI.Title.start,
            fontSize: 15,
            bgColor: .dalkomBlue,
            fgColor: .dalkomWhite
        )
        return button
    }()
    
    
    override func configureHierarchy() {
        view.addSubview(startButton)
    }
    
    override func configureLayout() {
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.1)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
        }

    }
    
    override func configureView() {
        super.configureView()
    }
}

