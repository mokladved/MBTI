//
//  Constants.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/13/25.
//

import Foundation

enum Constants {
    enum Messages {
        enum Error {
            static let containNumber = "닉네임에 숫자는 포함할 수 없어요."
            static let containSpecialCharacter = "닉네임에 @, #, $, %는 포함할 수 없어요"
            static let invalidLength = "2글자 이상 10글자 미만으로 설정해주세요"
        }
        enum Success {
            static let nickname = "사용할 수 있는 닉네임이에요"
        }
    }
    
    enum UI {
        enum Title {
            static let profileSetting = "PROFILE SETTING"
            static let start = "시작하기"
            static let specialCharacters = "@#$%"
        }
        enum Placeholder {
            static let profileSeting = "닉네임을 입력해주세요 :)"
        }
    }
    
}
