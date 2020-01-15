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
    
    //Set CoreData Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //Get Dictionay Entity Details
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>

    
    
    //Word Test
    @State private var inUrhoboTranslation = ""
    
    //Variable to be assigned the randome word
    @State private var localEnglishWord = ""
    @State private var resultEmojiState = ""
    
    
    //Function to process Emoji Result faces
    func processEmoji() -> String {
        
        
        var localEmojiFace = ""
        
        
        if self.inUrhoboTranslation == "" {
            
            localEmojiFace = " Sad 🥱"
        }
        
        if self.inUrhoboTranslation  != "" {
            
            localEmojiFace = "Happy 🤪"
        }
        
        
        return localEmojiFace
    }
    
    
    
    var body: some View {
        
        
        
        VStack {
        
        Form {
            
            
            
            Section(header: Text("English Word").bold()) {
                
                HStack {
            
                    Text("\(self.localEnglishWord)")
                        .foregroundColor(Color.green)
                    Spacer()
                    
                    //Button to generate word
                    Button(action: {
                        
                        if let getRandomEnglishWord = self.dictionary.randomElement() {
                            
                            self.localEnglishWord = getRandomEnglishWord.englishWord
                            readRandomEnglishWord(word: self.localEnglishWord)
                            
                            //Reset Urhobo Word
                            self.inUrhoboTranslation = ""
                            
                        }
                        
                    
                        
                        
                    }) {
                        
                        
                        Text("Get Word")
                            .padding()
                            .frame(width:120,height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                        
                    }//End Button
                    
                }//End HStack
            
            } //End of English Word Section
            
            
            Section(header: Text("Urhobo Translation").bold()) {
                
                HStack {
                
                    TextField("Transalation",text: $inUrhoboTranslation)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    Spacer()
                    
                    
                
                }
            }//End of Urhobo Word Section
            
            Section(header: Text("Result From Game").bold()) {
                
            //CoreData Filter from Game Play Predicate
            FilterWordGamePlay(filter: self.inUrhoboTranslation)
                
            
            }
        }//Form Ending
    
        
            
   
        
        }//End of VStack
        
        
        
    }//End Body View
    
}//End Struct View

