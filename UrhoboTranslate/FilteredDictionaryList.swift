//
//  FilteredDictionaryList.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 09/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI
import CoreData


struct FilteredDictionaryList: View {

    //Customised Fetch Request
    var fetchRequest: FetchRequest<Dictionary>

    var body: some View {
        List(fetchRequest.wrappedValue,id:  \.self) { word in
            
            Text("\(word.englishWord) - \(word.urhoboWord)")
            
            
            
        }
    }
    
    init(filter: String) {
     
        fetchRequest = FetchRequest<Dictionary>(entity: Dictionary.entity(), sortDescriptors: [], predicate: NSPredicate(format: "englishWord BEGINSWITH %@", filter))
        
        
    }
        
}

/*
struct FilteredDictionaryList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDictionaryList()
    }
}
 
 */
