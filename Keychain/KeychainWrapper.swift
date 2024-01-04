//
//  KeychainWrapper.swift
//  Keychain
//
//  Created by Macbook Air 2017 on 4. 1. 2024..
//

import Foundation

class KeychainWrapper {
    
    static func set(value: Data, account: String) throws {
        // updating if item already exists
        if try KeychainOperations.exists(account: account) {
            try KeychainOperations.update(value: value, account: account)
        }
        else {
            try KeychainOperations.add(value: value, account: account)
        }
    }
    
    static func get(account: String) throws -> Data? {
        if try KeychainOperations.exists(account: account) {
            return try KeychainOperations.retreive(account: account)
        }
        else {
            throw KeychainError.OperationError
        }
    }
    
    static func delete(account: String) throws {
        if try KeychainOperations.exists(account: account) {
            try KeychainOperations.delete(account: account)
        }
        else {
            throw KeychainError.OperationError
        }
    }
}
