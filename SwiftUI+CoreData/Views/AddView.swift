//
//  AddView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 31.10.2020.
//

import SwiftUI

struct AddView: View {
    @State var name = ""
    @State var phone = ""
    @State var image: String?
    @State var email = ""
    let onComplete: (String, String, String?, String?) -> Void
    let checker = Checker()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name:")) { HStack {
                    TextField("Name", text: $name)
                    if checker.checkName(name: name) {
                        
                    } else {
                        Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
                    }
                }
                }
                Section(header: Text("Phone:")) {HStack {
                    TextField("81234567890", text: $phone).keyboardType(.numberPad)
                    if checker.checkPhone(phone: phone) {
                        
                    } else {
                        Image(systemName: "exclamationmark.triangle").foregroundColor(.red)
                    }
                }
                }
                Section(header: Text("Email:")) {
                    TextField("example@domain.com", text: $email).keyboardType(.emailAddress)
                }
                Section {
                    if checker.checkName(name: name) && checker.checkPhone(phone: phone) {
                        Button(action: addAction) {
                            Text("Add")
                        }
                    } else {
                        Button(action: addAction) {
                            Text("Add")
                        }.disabled(true)
                    }
                }
            }
            .navigationBarTitle(Text("Add Contragent"), displayMode: .inline)
        }
    }
    
    private func addAction() {
        onComplete(name, phone, image, email)
    }
}
