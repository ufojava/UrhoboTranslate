//
//  ListDeleteDictionary.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 03/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Struct to list / Delete  CoreData
import SwiftUI
import CoreData


struct ListDictionary: View {
    
    //Set CoreData Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //Set Entity
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>

    
    
    
    
    
    var body: some View {
        
       
       
            
            List {
        
                ForEach(dictionary, id: \.self) { word in
                    
                    VStack(alignment: .leading) {
                        Text("English Word: \(word.englishWord)")
                        Text("Urhobo Transalation: \(word.urhoboWord)")
                            .foregroundColor(Color.blue)
                        
                        HStack {
                        
                        Text("Picture:")
                            .foregroundColor(Color.green)
                        Image(word.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width:30, height: 30)
                        }
                    }
                
                        .navigationBarTitle(Text("Urhobo Translations"),displayMode: .automatic)
                    
                }//End ForEach
         
            
                
            
            }//End of List
            

     
        
        
    }//End of Body View
    
    
}//End of struct view



struct ListDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ListDictionary()
        
    }
}


