//
//  TitleRow.swift
//  ChatApplication
//
//  Created by Raman Tank on 04/10/24.
//

import SwiftUI

struct TitleRow: View {
    var imageURl = URL(string: "https://images.unsplash.com/photo-1662316208133-55e8e16f89fb?q=80&w=3774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    let name = "Shivanshu Gupta"
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(
                url: imageURl
            ) {
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name).font(.title).bold()
                Text("Online").font(.caption).foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill").padding()
                .foregroundColor(.gray).background(.white)
                .cornerRadius(50)
        }.padding()
    }
}

#Preview {
    TitleRow().background(Color("Peach"))
}
