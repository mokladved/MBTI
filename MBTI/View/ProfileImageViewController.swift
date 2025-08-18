//
//  ProfileImageViewController.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/18/25.
//

import UIKit
import SnapKit

final class ProfileImageViewController: BaseViewController {

    private let viewModel: ProfileImageViewModel

    private let profileImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.dalkomBlue.cgColor
        imageView.layer.borderWidth = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let totalSpacing = spacing * 2
        let itemsPerRow: CGFloat = 4
        let width = (UIScreen.main.bounds.width - totalSpacing - (spacing * (itemsPerRow - 1))) / itemsPerRow
        
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    init(viewModel: ProfileImageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            viewModel.input.saveButtonTapped.value = ()
        }
    }
    
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    override func configureHierarchy() {
        view.addSubview(profileImageView)
        view.addSubview(collectionView)
    }

    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
            make.size.equalTo(120)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        super.configureView()
    }
    
    private func configureNav() {
        navigationItem.title = Constants.UI.Title.profileSetting
    }

    private func bindData() {
        viewModel.output.currentImageName.bind { [weak self] imageName in
            self?.profileImageView.image = UIImage(named: imageName)
            self?.collectionView.reloadData()
        }
    }
    
    @objc private func saveButtonTapped() {
        viewModel.input.saveButtonTapped.value = ()
    }
}

extension ProfileImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCollectionViewCell.identifier, for: indexPath) as? ProfileImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let imageName = "\(indexPath.item + 1)"
        cell.configure(with: imageName)
        cell.isSelected = (imageName == viewModel.output.currentImageName.value)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageName = "\(indexPath.item + 1)"
        viewModel.input.imageSelected.value = imageName
    }
}
