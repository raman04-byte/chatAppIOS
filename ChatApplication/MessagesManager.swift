//
//  MessagesManager.swift
//  ChatApplication
//
//  Created by Raman Tank on 04/10/24.
//

import Foundation

import FirebaseFirestore
import FirebaseFirestoreCombineSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
         db.collection("messages").addSnapshotListener { querySnapshot, error in
             guard let documents = querySnapshot?.documents else {
                 print("Error fetching documents: \(String(describing: error))")
                 return
             }
             self.messages = documents.compactMap { document -> Message? in
                 do {
                     return try document.data(as: Message.self)
                 } catch {
                     print("Error decoding document into Message: \(error)")
                     return nil
                 }
             }
             
             self.messages.sort{ $0.timestamp < $1.timestamp}
             
             if let id = self.messages.last?.id {
                 self.lastMessageId = id
             }
         }
     }
    
    func sendMessages(text: String){
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch{
            print("Error sending message: \(error)")
        }
    }
     
}
