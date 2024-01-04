//
//  KeychainOperations.swift
//  Keychain
//
//  Created by Macbook Air 2017 on 4. 1. 2024..
//

import Foundation

class KeychainOperations: NSObject {
    
    // Checking if an item exists in the keychain
    static func exists(account: String) throws -> Bool {
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: false] as NSDictionary, nil)
        
        switch status {
        case errSecSuccess:
            return true
        case errSecItemNotFound:
            return false
        default:
            throw KeychainError.KeychainCreatingError
        }
    }
    
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
    
    // Retreiving an item's value from the keychain
    static func retreive(account: String) throws -> Data? {
        var result: AnyObject?
        
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service,
            kSecReturnData: true
        ] as NSDictionary, &result)
        
        switch status {
        case errSecSuccess:
            return result as? Data
        case errSecItemNotFound:
            return nil
        default:
            throw KeychainError.OperationError
        }
    }
    
    static func delete(account: String) throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service] as NSDictionary)
        
        guard status == errSecSuccess else {
            throw KeychainError.OperationError
        }
    }
    
    // Deleting all items for the app
    static func deleteAll() throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword] as NSDictionary)
        
        guard status == errSecSuccess else {
            throw KeychainError.OperationError
        }
    }
}
