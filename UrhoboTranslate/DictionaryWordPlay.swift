//
//  DictionaryWordPlay.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 11/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//The code will demonstrate the play of words in the dictionary
import SwiftUI
import CoreData


//This struct is for Main Word Play
struct WordPlay: View {
    
    var body: some View {
        
        WordPlayList()
        
    }
    
}

//Preview Struct
struct WordPlay_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WordPlay()
    }
}


//Struct to create list for CoreData
struct WordPlayList: View {
    

    var body: some View {
        
  
        
                    VStack {
                        
                        WordTest()
                       
                         
                        
                        
                    }//End of VStack
     
        
                        .navigationBarTitle(Text("Word Test"),displayMode: .inline)
        
    
        
        
        
        
    }//End of View
}


//Struct to test knowledge
struct WordTest: View {
    
    
    //Word Test
    @State private var inEnglishWord = ""
    @State private var inUrhoboTranslation = ""
    
    
    
    var body: some View {
        
        Form {
            
            Section(header: Text("English Word").bold()) {
            
                TextField("English Word",text: $inEnglishWord)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
            
            } //End of English Word Section
            
            
            Section(header: Text("Urhobo Translation").bold()) {
                
                TextField("Transalation",text: $inUrhoboTranslation)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                
            }//End of Urhobo Word Section
            
            Section(header: Text("Result From Game").bold()) {
                
            //CoreData Filter from Game Play Predicate
             FilterWordGamePlay(filter: self.inUrhoboTranslation)
            
            }
        }//Form Ending
        
        
    }
}

