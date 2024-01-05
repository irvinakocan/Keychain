//
//  ViewController.swift
//  Keychain
//
//  Created by Macbook Air 2017 on 4. 1. 2024..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Testing Keychain Wrapper
        
        // Setting Data
        do {
            guard let password = "Hillary1249ex".data(using: .utf8) else {
                return
            }
            try KeychainWrapper.set(value: password, account: "password")
            print("You successfully put your password to the Keychain. \n")
        }
        catch {
            print(error)
        }
        
        // Update Data
        do {
            guard let newPassword = "holla23amigos".data(using: .utf8) else {
                return
            }
            try KeychainWrapper.set(value: newPassword, account: "password")
            print("You successfully updated your password in the Keychain. \n")
        }
        catch {
            print(error)
        }
        
        // Get Data
        do {
            guard let passwordData = try KeychainWrapper.get(account: "password"),
                  let password = String(data: passwordData, encoding: .utf8) else {
                return
            }
            print("Your set password in the Keychain is: \(password). \n")
        }
        catch {
            print(error)
        }
        
        // Delete Data
        do {
            try KeychainWrapper.delete(account: "password")
            print("You successfully deleted your password from the Keychain.")
        }
        catch {
            print(error)
        }
    }
}

