//
//  UnderlineTextField.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/15/25.
//
import UIKit
import SnapKit

final class UnderlineTextField: UITextField, UIConfigurable {
    private let underlineView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(underlineView)
    }
    
    func configureLayout() {
        underlineView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(8)
            make.height.equalTo(1)
        }
    }
    
    func configureView() {
        borderStyle = .none
        textColor = .black
    }
    
    
}
