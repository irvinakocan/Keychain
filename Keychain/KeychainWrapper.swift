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
        
        try KeychainOperations.add(value: value, account: account)
    }
}
