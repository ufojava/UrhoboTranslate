//
//  ContentView.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 31/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                
                Image("backgroundMainPage")
                    .resizable()
                    .scaledToFill()
                //Spacer().frame(height:400)
                
    
                
                
                //Call Menu
                MenuItem()
                    
                }.padding()
        
            
            .navigationBarTitle(Text("Home 🏚"))
            
        }//End of Navigation View
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
