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




//CoreData Search - Using Predictae
struct CoreDataSearch: View {
    
    //Set Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    //Variable for Search
    //@State private var wordFilter = ""
    @Binding var englishSearch: String
    
    
    var body: some View {
        
        VStack {
            
            
            TextField("Enter Search 🔍",text: $englishSearch)
                .autocapitalization(.words)
                .disableAutocorrection(true)
                .padding()
            
            
            //Get Filtered List
            FilteredDictionaryList(filter: self.englishSearch)
            
        }
        
        
        
    }
}

