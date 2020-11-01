//
//  ContentView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 31.10.2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Contragent.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Contragent.name, ascending: true)]) var contragents: FetchedResults<Contragent>
    
    @State var isPresented = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contragents, id: \.phone) { contragent in
                    let delegate = MainViewDelegate(mainView: self)
                    NavigationLink(destination: DetailView(mainView: delegate, contragent: contragent)) {
                        ContragentView(contragent: contragent)
                    }
                }
                
                
                .onDelete(perform: deleteContragent)
            }
            .listStyle(PlainListStyle())
            
            .sheet(isPresented: $isPresented) {
                AddView { name, phone, image, email in
                    self.addContragent(name: name, phone: phone, image: image, email: email)
                    self.isPresented = false
                }
            }
            .navigationBarTitle("Contragents")
            .navigationBarItems(trailing: Button(action: { self.isPresented.toggle()}) {
                Image(systemName: "plus")
            })
        }
    }
    
    func deleteContragent(at indexes: IndexSet) {
        indexes.forEach { index in
            let contragent = self.contragents[index]
            self.moc.delete(contragent)
        }
        saveContext()
    }
    
    func addContragent(name: String, phone: String, image: String?, email: String?) {
        let newContragent = Contragent(context: moc)
        
        newContragent.name = name
        newContragent.phone = phone
        newContragent.image = image
        newContragent.email = email
        
        saveContext()
    }
    
    func editContragent(at index: Int, name: String, phone: String, email: String, image: String?) {
        let contragent = contragents[index]
        contragent.name = name
        contragent.phone = phone
        contragent.email = email
        contragent.image = image ?? "no_avatar"
        saveContext()
    }
    
    func saveContext() {
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
