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
    @State private var learnImageToggle = true
    @State private var learningMenuToggle = false
    @State private var wordGameMenuToggle = false
    
    
    var body: some View {
        
        
        VStack {
            
            //Set View Background
            ZStack {
                
                VStack {
                    Spacer().frame(height:30)
                    
                    Image("backgroundV2")
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
                    
                //Insert Settings image
                if learnImageToggle{
                    
                    VStack {
                        
                            Spacer().frame(height:300)
                                
                            
                            Image("boyLearn")
                                .resizable()
                                .scaledToFill()
                                .frame(width:180, height:180)
                                //.shadow(radius: 3.0)
                            
                            }.transition(.scale)
                    
                            Spacer().frame(height:90)
                            
                            //Menu Options
                            Text("Menu 👇🏿👇🏿👇🏿")
                               .bold()
                               .foregroundColor(Color.green)
                               .font(.system(size:20))
                        
                        
                
                    Spacer()
                    
                }
                    
                    
                    
                 
                if learningMenuToggle {
                    
                    
                    //Menu List for Sub Menu
                    Text("Menu Options 👇🏿👇🏿👇🏿")
                           .bold()
                           .font(.headline)
                    
                       Spacer().frame(height:30)
                    
                    //Word Learning
                    NavigationLink(destination: WordLearning()) {
                    
                    
                            HStack {
                                
                                //Menu Icon
                                MenuIcon(icon: "doc.richtext")
                                    .foregroundColor(Color.yellow)
                                
                                //Menu Legend
                                Text("Learn Words")
                                    .foregroundColor(Color.black).fontWeight(.bold)
                                
                                
                            }//End of HStack
                        
                    
                    }//End to Navigation Link
                    
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
                
                self.learnImageToggle.toggle()
                
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                
                self.learningMenuToggle.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
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



