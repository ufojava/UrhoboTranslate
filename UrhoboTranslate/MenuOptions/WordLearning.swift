//
//  WordLearning.swift
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
    
    

    

    
    var body: some View {
       
       
            VStack {
                       
                       List {
                           
                           ForEach(dictionary.shuffled().prefix(upTo: 10),id: \.self) { word in
                            
                            
                            HStack {
                               Text("\(word.englishWord)")
                                    .foregroundColor(Color.blue)
                            
                                Text("| \(word.urhoboWord) |")
                                    .foregroundColor(Color.green)
                                    
                                Image(word.imageName)
                                    .resizable()
                                    .frame(width:40, height: 40)
                                    
                              
                            }//HStack
                            
                           }//End of ForEach
                        
                       }//End of List
                
               
                        .navigationBarTitle(Text("Begin Learning"),displayMode: .inline)
                
        
        
        
        }//Emd of VStack
            
        
        }//End of Body View
    
    }//End of Main View
    


struct PickerWordLearning_Preview: PreviewProvider {
    
    static var previews: some View {
        
        WordLearning()
    }
}

    
    

struct refreshList: View {
    
    //Set Environement
      @Environment(\.managedObjectContext) var managedObjectContext
      
      //Set FetchRequest
      @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    var body: some View {
        
        
        VStack {
                
                List {
                    
                    ForEach(dictionary.shuffled().prefix(upTo: 10),id: \.self) { word in
                        
                        Text("\(word.englishWord)")
                        
                    }
                }
        
                

        }
        
        
    }
}
