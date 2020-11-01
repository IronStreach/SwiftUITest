//
//  ContragentView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 31.10.2020.
//

import SwiftUI

struct ContragentView: View {
    let contragent: Contragent
    var body: some View {
        HStack (alignment: .center, spacing: 10) {
            ImageView(image: contragent.image ?? "no_avatar", size: 70)
            HStack(alignment: .center, spacing: 30) {
                
                VStack (alignment: .leading, spacing: 5) {
                    Text("Name:").font(.headline)
                    Text("Phone:").font(.subheadline)
                    Text("Email:").font(.subheadline)
                }
                
                VStack (alignment: .leading, spacing: 5) {
                    Text(contragent.name!).font(.headline)
                    Text(contragent.phone!).font(.subheadline)
                    
                    if contragent.email != nil && contragent.email != "" {
                        Text(contragent.email!)
                            .lineLimit(1)
                    } else {
                        Text("No email found").font(.callout).foregroundColor(Color.red)
                            .lineLimit(1)
                    }
                }
                
            }
        }    }
}

//struct ContragentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContragentView(contragent: ListViewModel().getContragents()[0])
//            .previewDevice("iPhone 11")
//    }
//}
