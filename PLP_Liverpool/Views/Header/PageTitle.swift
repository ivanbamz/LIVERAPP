//
//  PageTitle.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI
struct PageTitle: View {
    let title:String
    var body: some View {
        
        HStack{
            Text(title)
                .padding(3)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .top)
        }
    }
}
#Preview {
    PageTitle(title: "Liverpool")
}
