//
//  ProfileSettingViewController.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/14/25.
//

import UIKit
import SnapKit

final class ProfileSettingViewController: BaseViewController {
    
    private let profileImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.dalkomBlue.cgColor
        imageView.layer.borderWidth = 5

        DispatchQueue.main.async {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let cameraButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 12)
        let symbolImage = UIImage(systemName: "camera.fill", withConfiguration: symbolConfig)
            
        button.setImage(symbolImage, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .dalkomBlue
        DispatchQueue.main.async {
            button.layer.cornerRadius = 15
        }
        button.clipsToBounds = true
        return button
    }()

    
    private let nicknameTextField = {
        let textField = UnderlineTextField()
        return textField
    }()
    
    private let stateLabel = {
        let label = UILabel()
        return label
    }()
    
    private let mbtiLabel = {
        let label = UILabel()
        label.text = "MBTI"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let eButton = MBTIButton(title: "E")
    private let sButton = MBTIButton(title: "S")
    private let tButton = MBTIButton(title: "T")
    private let jButton = MBTIButton(title: "J")
    private let iButton = MBTIButton(title: "I")
    private let nButton = MBTIButton(title: "N")
    private let fButton = MBTIButton(title: "F")
    private let pButton = MBTIButton(title: "P")
    
    private let firstRowStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
       
    private let secondRowStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
       
    private let mbtiStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let mbtiLabelButtonWrappedStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .top
        return stackView
    }()
    
    
    private let doneButton = {
        let button = UIButton()
        button.configuration = .dalkomStyle(title: "완료", fgColor: .dalkomWhite)
        return button
    }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavTitle()
    }
    
    override func configureHierarchy() {
        view.addSubview(profileImageView)
        view.addSubview(cameraButton)
        view.addSubview(nicknameTextField)
        view.addSubview(stateLabel)
        view.addSubview(mbtiLabelButtonWrappedStackView)
        mbtiLabelButtonWrappedStackView.addArrangedSubview(mbtiLabel)
        mbtiLabelButtonWrappedStackView.addArrangedSubview(mbtiStackView)
        
        view.addSubview(firstRowStackView)
        firstRowStackView.addArrangedSubview(eButton)
        firstRowStackView.addArrangedSubview(sButton)
        firstRowStackView.addArrangedSubview(tButton)
        firstRowStackView.addArrangedSubview(jButton)
        
        view.addSubview(secondRowStackView)
        secondRowStackView.addArrangedSubview(iButton)
        secondRowStackView.addArrangedSubview(nButton)
        secondRowStackView.addArrangedSubview(fButton)
        secondRowStackView.addArrangedSubview(pButton)
        
        
        mbtiStackView.addArrangedSubview(firstRowStackView)
        mbtiStackView.addArrangedSubview(secondRowStackView)
        
        view.addSubview(doneButton)
    }
    
    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.trailing.equalTo(profileImageView.snp.trailing).inset(4)
            make.bottom.equalTo(profileImageView.snp.bottom).inset(4)
            make.width.height.equalTo(30)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(48)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44) 
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(nicknameTextField)
        }
        
        mbtiLabelButtonWrappedStackView.snp.makeConstraints { make in
            make.top.equalTo(stateLabel.snp.bottom).offset(80)
            make.horizontalEdges.equalTo(nicknameTextField)
        }

        [eButton, iButton, sButton, nButton, tButton, fButton, jButton, pButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.height.equalTo(50)
            }
        }
        
        doneButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(52)
        }
    }
    
    
    override func configureView() {
        super.configureView()
    }
}

extension ProfileSettingViewController {
    private func configureNavTitle() {
        navigationItem.title = Constants.UI.Title.profileSetting
    }
}
