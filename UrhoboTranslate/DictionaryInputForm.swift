//
//  DictionaryInputForm.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 01/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//File to hold struct where the creation of input form will reside

import CoreData
import SwiftUI


struct DictionaryForm: View {
    
//CoreData Environment
@Environment(\.managedObjectContext) var managedObjectContext
@FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>

//Set Observed Object
    @ObservedObject var dictionaryDetails = DictionaryWord()
    
    
    //Process Image File Name
    func processImageName() -> String {
        
        var localImageName = ""
        
        //Assign value to image Name
        localImageName = dictionaryDetails.englishWord.lowercased()
        
        return localImageName
    }

    
    
    var body: some View {
        
        NavigationView {
            
            Form {
            
                Section(header: Text("Word Input Details").fontWeight(.bold)) {
        
                    
                    TextField("English Word",text: $dictionaryDetails.englishWord)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    TextField("Urhobo Meaning",text: $dictionaryDetails.urhoboWord)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                
                }//Section Ends
                
                Section(header: Text("Image File Name").fontWeight(.bold)) {
                    
                    //Text("Place Holder")
                    
                    Text("Image File Name: \(processImageName())")
                    
                    
                    VStack {
                        
                        HStack {
                    Button(action: {}) {
                        
                        Text("Save Input")
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                        
                            
                            }
                    .padding(.horizontal, 130)
                    }//Hstack End
                    
                    }
                    
                }
                
                
            }//Form Ends
            
                .navigationBarTitle(Text("Dictionary Input Form"),displayMode: .inline)
            
        }//NaviagtionView Ends
        
        
    }//Body View Ends
    
}//Struct View Ends


//Struct preview
struct DictionaryForm_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DictionaryForm()
        
    }
}


