//
//  ImageView.swift
//  SwiftUI+CoreData
//
//  Created by Станислав Никишков on 31.10.2020.
//

import SwiftUI

struct ImageView: View {
    let image: String
    
    let size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 0))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: "no_avatar", size: 70)
    }
}

