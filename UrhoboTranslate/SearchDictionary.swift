//
//  SearchDictionary.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 06/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Struct to facilitate search CoreData with filter

import SwiftUI
import CoreData


struct SearchDictionary: View {
    
    @State private var textSrch = ""
    @State private var englishSearch = ""
    
    var body: some View {
      
        
    
        VStack {
       
        //searchView(textSrch: $textSrch)
        CoreDataSearch(englishSearch: $englishSearch)
        
        Spacer()
            
            .navigationBarTitle(Text("Dictionary Search"),displayMode: .inline)
        }
        
    }
}


//Preview
struct SearchDictionary_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchDictionary()
    }
}


struct searchView: View {
    
//Set CoreData Environment
@Environment(\.managedObjectContext) var managedObjectContext

//Set Fetch Request
@FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    
//Binding text field
    @Binding var textSrch: String

    
    var body: some View {

        VStack {
            
            ZStack {
                
                Rectangle()
                    .frame(width:400, height: 60)
                    .foregroundColor(Color.blue).opacity(0.4)
                    .cornerRadius(6)
                
                
                //Search Textfield and cancel button
                HStack {
                    
                    TextField("Enter English Word      🔍",text: $textSrch)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .padding()
                    
                    //Cancel Button
                    Button(action: {
                        
                        //Set Text Seach to blank
                         self.textSrch = ""
                        
                        
                    }) {
                        
                        
                        Text("Cancel")
                            .foregroundColor(Color.black)
                            .padding()
                        
                        
                    }
                    
                }//HStack End
                
                
            }//ZStack End
            
          
              
            
            if self.textSrch != "" {
                
               
                
                List(dictionary,id: \.self) { word in
                    
    
                    if word.englishWord == self.textSrch {
                        
                       
                        HStack {
                    
                            Text(word.englishWord)
                            Text("Translation - \(word.urhoboWord)")
                            Image(word.imageName)
                                .resizable()
                                .frame(width:70, height: 70)
                                .scaledToFill()
                            
                                
                            Spacer()
                        }//End HStack
                        
                        
                
                    }//End If Word Condition
                    
                }//End of List
                
            
               
                
                
            }//End If Condition
                
        
          
        }//VStack End
        
        
        
        
        
    }//Body View Ends
    
    
}//Struct View End

//CoreData Search - Using Predictae
struct CoreDataSearch: View {
    
    //Set Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    //Variable for Search
    //@State private var wordFilter = ""
    @Binding var englishSearch: String
    
    
    var body: some View {
        
        VStack {
            
            Text("Place Holder")
            TextField("Enter Search 🔍",text: $englishSearch)
                .autocapitalization(.words)
                .disableAutocorrection(true)
            
            
            //Get Filtered List
            FilteredDictionaryList(filter: self.englishSearch)
            
        }
        
        
        
        
        
    }
}

