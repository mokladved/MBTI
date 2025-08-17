//
//  NickNameState.swift
//  MBTI
//
//  Created by Youngjun Kim on 8/18/25.
//

import UIKit

enum NickNameState {
    case empty
    case valid(message: String)
    case invalid(message: String)

    var message: String {
        switch self {
        case .empty:
            return ""
        case .valid(let message), .invalid(let message):
            return message
        }
    }

    var color: UIColor {
        switch self {
        case .empty:
            return .clear
        case .valid:
            return .dalkomBlue
        case .invalid:
            return .dalkomRed
        }
    }

    var isValid: Bool {
        switch self {
        case .valid:
            return true
        default:
            return false
        }
    }
}
