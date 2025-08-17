//
//  ProfileSettingViewModel.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/18/25.
//

import UIKit

final class ProfileSettingViewModel {
    struct Input {
        let nicknameText: Observable<String?> = Observable(nil)
        let mbtiButtonTapped: Observable<(selected: Character, set: Character)?> = Observable(nil)
    }
    
    struct Output {
        let nicknameState: Observable<NickNameState> = Observable(.empty)
        let selectedMBTI: Observable<Set<Character>> = Observable([])
        let isDoneButtonEnabled: Observable<Bool> = Observable(false)
    }
    
    let input: Input
    let output: Output
    
    private var nickname: String = ""
    private var selectedMBTI: Set<Character> = []
    
    init() {
        input = Input()
        output = Output()
        bind()
    }
    
    private func bind() {
        input.nicknameText.bind { [weak self] text in
            guard let self = self,
                  let text = text else {
                return
            }
            
            self.nickname = text
            
            self.output.nicknameState.value = self.validateNickname(text)
            self.output.isDoneButtonEnabled.value = self.checkCondition()
        }
        
        input.mbtiButtonTapped.bind { [weak self] tappedInfo in
            guard let self = self,
                  let info = tappedInfo else {
                return
            }
            
            self.updateButtonState(selected: info.selected, set: info.set)
            self.output.selectedMBTI.value = self.selectedMBTI
            self.output.isDoneButtonEnabled.value = self.checkCondition()
        }
    }
    
    private func validateNickname(_ nickname: String) -> NickNameState {
        if nickname.isEmpty {
            return .empty
        }
        
        if nickname.count < 2 || nickname.count >= 10 {
            return .invalid(message: Constants.Messages.Error.invalidLength)
        }
        
        if nickname.contains(where: { $0.isNumber }) {
            return .invalid(message: Constants.Messages.Error.containNumber)
        }
        
        let specialCharacters = CharacterSet(charactersIn: Constants.UI.Title.specialCharacters)
        
        if nickname.rangeOfCharacter(from: specialCharacters) != nil {
            return .invalid(message: Constants.Messages.Error.containSpecialCharacter)
        }
        
        return .valid(message: Constants.Messages.Success.nickname)
    }
    
    private func updateButtonState(selected: Character, set: Character) {
        if selectedMBTI.contains(selected) {
            selectedMBTI.remove(selected)
        } else {
            selectedMBTI.remove(set)
            selectedMBTI.insert(selected)
        }
    }
    
    private func checkCondition() -> Bool {
        return validateNickname(nickname).isValid && selectedMBTI.count == 4
    }
}
