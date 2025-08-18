//
//  ProfileImageCollectionViewCell.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/18/25.
//

import UIKit
import SnapKit

final class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileImageCollectionViewCell"
    
    private let profileImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.systemGray3.cgColor
        DispatchQueue.main.async {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            profileImageView.layer.borderColor = isSelected ? UIColor.dalkomBlue.cgColor : UIColor.systemGray3.cgColor
            profileImageView.layer.borderWidth = isSelected ? 5 : 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    func configure(with imageName: String) {
        profileImageView.image = UIImage(named: imageName)
    }
    
    private func configureHierarchy() {
        contentView.addSubview(profileImageView)
    }
    
    private func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
