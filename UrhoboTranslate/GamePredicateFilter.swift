//
//  GamePredicateFilter.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 11/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Predicate Filter for Game play
import SwiftUI
import CoreData

struct FilterWordGamePlay: View {
    
    //Fetch Request
    var fetchRequest:FetchRequest<Dictionary>
    
    @State private var wordCorrect = false
    
    var body: some View {
        
     
        //List result
        List(fetchRequest.wrappedValue,id: \.self) { word in
            
            HStack {
            Text("\(word.englishWord) - ")
            Text(word.urhoboWord)
            Image(word.imageName)
                .resizable()
                .scaledToFill()
                .frame(width:30, height: 30)
                Spacer()
                
                
                Button(action: {
                    
                    if word.englishWord != "" {
                        
                        self.wordCorrect = true
                        
                        //Play sound
                        playSound(sound: "correct", type: "m4a")
                        
                    }
                    
                }) {
                    
                    Text("Score")
                        .padding()
                        .frame(width:120,height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                    
                }
                    
            
            }
            
        }
        
    }
    
    
    //Init for Filter for Fetch Request
    init(filter: String) {
        
        fetchRequest = FetchRequest<Dictionary>(entity: Dictionary.entity(), sortDescriptors: [],predicate: NSPredicate(format: "urhoboWord == %@", filter))
    }
    
    
    
    
}






