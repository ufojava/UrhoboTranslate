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
    
    
    //Variable to calculate score
    @State private var score = 0
    
    //Variable to show alert
    @State private var showAlert = false
    
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
                        
                        //Set Alert to true
                        self.showAlert = true
                        
                        //Calculate score
                        self.score += 1
                        
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
                    
                        .alert(isPresented: self.$showAlert) {
                            Alert(title: Text("Game Progress"), message: Text("Score: \(self.score)"), dismissButton: .default(Text("To Continue, Click Get Word!!"))) 
                            
                    }//Show Alert
                    
                }//Button Closure
                    
            
            }//Hstack
            
        }//List
        
    }//Body View
    
    
    //Init for Filter for Fetch Request
    init(filter: String) {
        
        fetchRequest = FetchRequest<Dictionary>(entity: Dictionary.entity(), sortDescriptors: [],predicate: NSPredicate(format: "urhoboWord == %@", filter))
    }
    
    
    
    
}






