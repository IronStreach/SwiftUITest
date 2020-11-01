//
//  Checker.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 01.11.2020.
//

import Foundation

struct Checker {
    func checkName(name: String?) -> Bool {
        guard name != nil else { return false }
        guard name != "" else { return false }
        guard name!.count > 3 && name!.count < 26 else { return false }
        guard Int(name!) == nil else { return false }
        return true
    }
    
    func checkPhone(phone: String?) -> Bool {
        guard phone != nil else { return false }
        guard phone?.count == 11 else { return false }
        guard Int(phone!) != nil else { return false }
        return true
    }
    
    
}
