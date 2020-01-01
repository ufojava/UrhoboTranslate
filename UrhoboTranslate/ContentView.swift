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
            
            ZStack(alignment: .center) {
                
                
                Image("IOS_Bkgrd_CurveBlue")
                    .resizable()
                    .scaledToFill()
                    
                    .edgesIgnoringSafeArea(.all)
                
                
                
                //Call Menu
                MenuItem()
                    
            }
        
            
            .navigationBarTitle(Text("Home 🏚"))
            
        }//End of Navigation View
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
