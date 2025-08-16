//
//  MBTIButton.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/16/25.
//

import UIKit

final class MBTIButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            updateUI()
        }
    }

    private func configureUI() {
        titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        layer.borderWidth = 2
        updateUI()
    }
    
    private func updateUI() {
        if isSelected {
            backgroundColor = .dalkomBlue
            setTitleColor(.white, for: .normal)
            layer.borderColor = UIColor.dalkomBlue.cgColor
        } else {
            backgroundColor = .white
            setTitleColor(.lightGray, for: .normal)
            layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
