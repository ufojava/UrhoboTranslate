//
//  WordLearning.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 20/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//This file teaches word and translations
import SwiftUI

struct WordLearningTest: View {
    
    
    var naijaObjects =  ["leg","hand","book","glasses","eyes","spoon","fork","phone","ball","finger","hair","block"]
    
    @State private var selectedObject = 0
    
    var body: some View {
        
        NavigationView { //For Testing
        
        Form {
            
            Picker(selection: $selectedObject, label: Text("Select Object")) {
                
                ForEach(0..<5) {
                    
                    Text(self.naijaObjects[$0])
                }
                
            
                
            }
            
            Text("The Object selected is: \(naijaObjects[selectedObject])")
        }
        
        
        
       
    }//Navigation View for testing
        
    }
}





struct WordLearning_Previews: PreviewProvider {
    static var previews: some View {
        WordLearningTest()
    }
}
