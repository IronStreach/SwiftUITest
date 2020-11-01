//
//  DataForDetailView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 01.11.2020.
//

import SwiftUI

struct DataForDetailView: View {
    let contragent: Contragent
    var body: some View {
        
        HStack(alignment: .top, spacing: 40) {
            VStack(alignment: .center, spacing: 40) {
                
                ImageView(image: contragent.image ?? "no_avatar", size: 300)
                
                VStack(spacing: 20) {
                    Text(contragent.name!).font(.title)
                    Text(contragent.phone!).font(.title2)
                    if contragent.email != nil && contragent.email != "" {
                        Text(contragent.email!).font(.title2)
                    } else {
                        Text("No email found").font(.title2)
                    }
                }
                
            }
            
            
        }
    }
}

//struct DataForDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataForDetailView()
//    }
//}
