//
//  KeychainConstants.swift
//  Keychain
//
//  Created by Macbook Air 2017 on 4. 1. 2024..
//

import Foundation

// Name of our service
let service = "MyPasswordsKeychainService"

enum KeychainError: Error {
    case KeychainCreatingError
    case OperationError
}
