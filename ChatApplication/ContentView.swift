//
//  ContentView.swift
//  ChatApplication
//
//  Created by Raman Tank on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader{
                    proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }.padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .onChange(of: messagesManager.lastMessageId){
                            id in withAnimation{
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                            
                        }
                }
                
            
            }.background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
        
    }
}

#Preview {
    ContentView()
}
