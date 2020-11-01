//
//  MainViewDelegate.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 01.11.2020.
//

import Foundation

class MainViewDelegate {
    var mainView: ContentView
    
    func deleteContragent(at indexes: IndexSet) {
        mainView.deleteContragent(at: indexes)
    }
    
    func editContragent(at index: Int, name: String, phone: String, email: String) {
        mainView.editContragent(at: index, name: name, phone: phone, email: email, image: nil)
    }
    
    init(mainView: ContentView) {
        self.mainView = mainView
    }
}
