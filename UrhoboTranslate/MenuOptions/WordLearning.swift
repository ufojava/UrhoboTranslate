//
//  File.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 21/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Code to execute the word learning process
import SwiftUI
import CoreData

struct WordLearning: View {
    
    //Set Environement
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //Set FetchRequest
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    @State private var shuffleDictionary: [String] = []
    

    
    
    
    @State private var selectEnglishWord = 0
    
    var body: some View {
        
        //NavigationView {
        
        //Form to take input
        
        Form {
            
            
            
        
            Section(header: Text("Word Selection")) {
                
                //Button to shuffle dictionary
                
                Picker(selection: $selectEnglishWord, label: Text("Make Selection")) {
                    
                
                    
                    ForEach(0..<5) {
                        
                        Text("\(self.dictionary.shuffled()[$0].englishWord)")
                }
                
                }
                
            
                Text("You selected \(dictionary[selectEnglishWord].englishWord)")
            
            }//End of Section
            
        }
        
    //}
    }
    
}

struct PickerWordLearning_Preview: PreviewProvider {
    
    static var previews: some View {
        
        WordLearning()
    }
}


