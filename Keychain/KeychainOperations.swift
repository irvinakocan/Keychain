//
//  KeychainOperations.swift
//  Keychain
//
//  Created by Macbook Air 2017 on 4. 1. 2024..
//

import Foundation

class KeychainOperations: NSObject {
    
    /*
     Adding an item to the Keychain
     Parameters:
        value: value to save in a Data format
        account: name for the given item's value
     */
    static func add(value: Data, account: String) throws {
        let status = SecItemAdd([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            // Allow background acess:
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData: value] as NSDictionary, nil)
        guard status == errSecSuccess else {
            throw Errors.operationError
        }
    }
}
