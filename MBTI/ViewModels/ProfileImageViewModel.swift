//
//  ProfileImageViewModel.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/18/25.
//

import Foundation

final class ProfileImageViewModel {
    
    struct Input {
        let imageSelected: Observable<String?> = Observable(nil)
        let saveButtonTapped: Observable<Void?> = Observable(nil)
    }
    
    struct Output {
        let currentImageName: Observable<String> = Observable("")
        let saveCompleted: Observable<String?> = Observable(nil)
    }
    
    let input: Input
    let output: Output
    
    init(initialName: String) {
        self.input = Input()
        self.output = Output()
        
        self.output.currentImageName.value = initialName

        bind()
    }
    
    private func bind() {
        input.imageSelected.bind { [weak self] imageName in
            guard let self = self, let imageName = imageName else { return }
            self.output.currentImageName.value = imageName
        }
        
        input.saveButtonTapped.bind { [weak self] _ in
            guard let self = self else { return }
            self.output.saveCompleted.value = self.output.currentImageName.value
        }
    }
}
