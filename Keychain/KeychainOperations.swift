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
            // indicating that it’s a generic password or a sensible data.
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            // allowing background access:
            // telling the compiler this data will be available always as posible
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData: value] as NSDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.OperationError
        }
    }
    
    static func update(value: Data, account: String) throws {
        let status = SecItemUpdate([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service] as NSDictionary, [
                kSecValueData: value] as NSDictionary)
        guard status == errSecSuccess else {
            throw KeychainError.OperationError
        }
    }
}
