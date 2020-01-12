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
    
    var body: some View {
        
     
        //List result
        List(fetchRequest.wrappedValue,id: \.self) { word in
            
            HStack {
            Text(word.englishWord)
            Text(word.urhoboWord)
            Image(word.imageName)
                .resizable()
                .scaledToFill()
                .frame(width:30, height: 30)
                    
            
            }
            
        }
        
    }
    
    
    //Init for Filter for Fetch Request
    init(filter: String) {
        
        fetchRequest = FetchRequest<Dictionary>(entity: Dictionary.entity(), sortDescriptors: [],predicate: NSPredicate(format: "urhoboWord == %@", filter))
    }
    
    
    
    
}






