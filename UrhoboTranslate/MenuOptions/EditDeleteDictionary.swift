//
//  EditDeleteDictionary.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 04/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Struct to edit and delete Dictionary in CoreData

import SwiftUI
import CoreData


struct EditDeleteDictionary: View {
    
    //Set CoreData Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //Set CoreData Fetch Request
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Dictionary.englishWord, ascending: true)]) var dictionary: FetchedResults<Dictionary>

    
    
    
    var body: some View {
        
        List {
            
            ForEach(dictionary,id: \.self) { word in
                
                Text("\(word.englishWord) / \(word.urhoboWord)")
                
            }//End ForEach
            
            //Delete Word
            .onDelete(perform: deleteWord(indexSet:))
            
            
        }//End List
        
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle(Text("Edit Dictionary"))
        
    }//End Body View
    
    func deleteWord(indexSet: IndexSet) {
        let source = indexSet.first!
        let dictionaryWord = dictionary[source]
        managedObjectContext.delete(dictionaryWord)
        
        //Save CoreData
        try? managedObjectContext.save()
        
        
    }
    
}//End Struct



//Setup Previews
struct EditDeleteDictionary_Previews: PreviewProvider {
    static var previews: some View {
        
        EditDeleteDictionary()
        
    }
}


