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
    
    
    //Input form variables
    @State private var inEnglishWord = ""
    @State private var inUrhoboWord = ""
    @State private var imageName = ""
    
    //Show Aler
    @State private var showSaveDateAlert =  false
    
    
    
    //Process Image File Name
    func processImageName(){
        
        
        //Assign value to image Name
        let reformatImageName = inEnglishWord.lowercased()
        
        //Assign ObServed Variables with the state variables
        dictionaryDetails.englishWord = inEnglishWord
        dictionaryDetails.urhoboWord = inUrhoboWord
        dictionaryDetails.imageName = reformatImageName
        
        
    }
    
    //Function to reset form
    func inputFormReset() {
        
        //Clear Private State Variables
        self.inEnglishWord = ""
        self.inUrhoboWord = ""
        self.imageName = ""
        
        //Clear Observed Variables
        dictionaryDetails.id = 0
        dictionaryDetails.englishWord = ""
        dictionaryDetails.urhoboWord = ""
        dictionaryDetails.imageName = ""
        
    }

    
    
    var body: some View {
        
        NavigationView {
            
            Form {
            
                Section(header: Text("Word Input Details").fontWeight(.bold)) {
        
                    
                    TextField("English Word",text: $inEnglishWord)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    
                    
                    TextField("Urhobo Meaning",text: $inUrhoboWord)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                
                }//Section Ends
                
                Section(header: Text("Process Data Input ").fontWeight(.bold)) {
                    
                        
                        HStack {
                    Button(action: {
                        
                        //Process Data Input
                        self.processImageName()
                        
                        //Add Form entry into Dcitionary CoreData
                        let word = Dictionary(context: self.managedObjectContext)
                        word.englishWord = self.dictionaryDetails.englishWord
                        word.urhoboWord = self.dictionaryDetails.urhoboWord
                        word.imageName = self.dictionaryDetails.imageName
                        
                        //Now save to CoreData
                        try? self.managedObjectContext.save()
                        
                        self.showSaveDateAlert = true
                        
                        //Reset Form
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            
                            self.inputFormReset()
                        }
                        
                        
                        
                    }) {
                        
                        
                        Text("Process")
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                        
                            
                            }
                    .padding(.horizontal, 130)
                        
                    //Show Alert for Data input
                    .alert(isPresented: $showSaveDateAlert) {
                        Alert(title: Text("Dictionay Message"), message: Text("Input Saved"), dismissButton: .default(Text("OK")))
                            }
                    }//Hstack End
                    
                    }//Section Ends
                
                
                Section(header: Text("Result of Data Input").fontWeight(.bold)) {
                    
                    Text("English Word: \(self.dictionaryDetails.englishWord)")
                    Text("Urhobo Word: \(self.dictionaryDetails.urhoboWord)")
                    Text("Image Name: \(self.dictionaryDetails.imageName)")
                    
                    
                    
                    
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


