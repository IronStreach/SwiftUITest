//
//  DetailView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 01.11.2020.
//

import SwiftUI

struct DetailView: View {
    
    var mainView: MainViewDelegate
    var contragent: Contragent
    @State var isPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.top)
                }
                
                VStack(alignment: .center, spacing: 0) {
                    Color.clear
                        .frame(width: geometry.size.width, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Color.white
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .cornerRadius(20)
                    
                    
                }
            }
            
            VStack {
                Color.clear
                    .frame(width: geometry.size.width, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                DataForDetailView(contragent: contragent)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
            
        }
        .navigationBarItems(trailing: HStack {
            Button(action: {
                mainView.deleteContragent(at: IndexSet(integer: 0))
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "trash").foregroundColor(.red)
            }
            Button(action: { self.isPresented.toggle() }) {
                Image(systemName: "edit")
            }
        })
        .sheet(isPresented: $isPresented) {
            AddView(name: contragent.name ?? "", phone: contragent.phone ?? "", image: nil, email: contragent.email ?? "") { name, phone, image, email in
                mainView.editContragent(at: 0, name: name, phone: phone, email: email ?? "")
                self.isPresented = false
            }
        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
