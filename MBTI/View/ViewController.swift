//
//  ViewController.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/13/25.
//

import UIKit
import SnapKit

final class ViewController: BaseViewController {
    
    private let startButton = {
        let button = UIButton()
        button.configuration = .dalkomStyle(
            title: Constants.UI.Title.start,
            fontSize: 15,
            bgColor: .dalkomBlue,
            fgColor: .dalkomWhite
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grantAction()
    }
    
    private func grantAction() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        print(self, #function)
        let nextVC = ProfileSettingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func configureHierarchy() {
        print(self, #function)
        view.addSubview(startButton)
    }
    
    override func configureLayout() {
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.1)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
        }
    }
    
    override func configureView() {
        print(self, #function)
        super.configureView()
    }
}

