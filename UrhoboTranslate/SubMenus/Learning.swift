//
//  Learning.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 17/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Learning Menu
import SwiftUI

struct Learning: View {
    
    //State Variable for Leaning
    @State private var learningMenuToggle = false
    @State private var wordGameMenuToggle = false
    
    
    var body: some View {
        
        
        VStack {
            
            //Set View Background
            ZStack {
                
                VStack {
                    
                    Image("IOS_Bkgrd_CurveBlue")
                        .resizable()
                        .scaledToFill()
                    
                    //Button to show menu
                    Button(action: {
                        
                        //Show Menu
                        self.showMenu()
                        
                        
                    }) {
                        
                    
                        Text("Show Menu")
                    }
                    
                    
                }
                
                VStack {
                 
                if learningMenuToggle {
                    
                    //Insert link here
                    
                    
                        //Menu List for Sub Menu
                        Text("Menu Options 👇🏿👇🏿👇🏿")
                               .bold()
                               .font(.headline)
                        
                           Spacer().frame(height:30)
                        
                    
                    HStack {
                        
                        //Menu Icon
                        MenuIcon(icon: "doc.richtext")
                            .foregroundColor(Color.yellow)
                        
                        //Menu Legend
                        Text("Learn Words")
                            .foregroundColor(Color.black).fontWeight(.bold)
                        
                        
                    }//End of HStack
                    
                    
                }//End of If Statement
                
                if wordGameMenuToggle {
                    
                    //Link to word game
                    NavigationLink(destination: WordPlay()) {
                        
                        HStack {
                            
                            //Menu Icon
                            MenuIcon(icon: "gamecontroller")
                                .foregroundColor(Color.purple)
                            
                            //Menu Legend
                            Text("Word Game ")
                                .foregroundColor(Color.black).fontWeight(.bold)
                            
                        }//End HStack
                        
                        
                        
                    }//End Navigation Link
                    
                    
                    
                    
                    
                }//End If Statement for Game
                    
                }//End VStack for all Icons
                
                
            }.padding() //End of ZStack
            
            .navigationBarTitle(Text("Learning Menu"))
        
        }
        
    }
    
    //Function to show menu
    func showMenu() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.learningMenuToggle.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                
                self.wordGameMenuToggle.toggle()
            }
        }
        
        
        
    }//End ShowFunction
    
    
}

struct Learning_Previews: PreviewProvider {
    static var previews: some View {
        Learning()
    }
}



