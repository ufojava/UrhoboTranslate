//
//  Menu.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 31/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//Menu System

import SwiftUI

struct MenuItem: View {
    
    //Toggle for menus
    @State private var settingsMenuToggle = false
    @State private var searchMenuToggle = false
    
   
    @State private var listDictionaryMenuToggle = false
    @State private var searchDictionaryMenuToggle = false
    @State private var wordPlayMenuToggle = false
    @State private var menuPlaceHolderTitleToggle = true
    
    
    

    
    
    var body: some View {
       
        VStack {
            
           
                VStack {
                    Spacer().frame(height: 230)
                    
                    
                    
                    if menuPlaceHolderTitleToggle {
                        
                        VStack {
                        
                           
                            Text("Urhobo for Beginners 😳")
                                
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .shadow(radius: 3.0)
                                
                          
                            Image("mainPageArtV2")
                                .resizable()
                                .scaledToFill()
                                .frame(width:100, height:100)
                                .shadow(radius: 3.0)
                    
                
                        }.transition(.scale)
                        
                    }//End Menu Place Holder
                    
                 
            
            if settingsMenuToggle {
                
                //Menu Header
                
                
                Text("Menu Options 👇🏿👇🏿👇🏿")
                    .bold()
                    .font(.headline)
             
                Spacer().frame(height:30)
                   
                
                    //Dictionary
                    HStack {
                        
                        NavigationLink(destination: Settings()) {
                            
                            
                            MenuIcon(icon: "gear")
                                .foregroundColor(Color.red)
                            
                            //Icon Legend
                            Text("Settings ").fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                        }
                    
                    }
                
            }//Settings Menu
                
    
            
                if searchMenuToggle {
                    
                    HStack {
                        
                        //Call List Struct
                        NavigationLink(destination: SearchMenu()) {
                            
                            //Call List Naviation Link
                                  MenuIcon(icon: "magnifyingglass")
                                      .foregroundColor(Color.green)
                                  
                                  //Icon Legend
                                  Text("Search   ").fontWeight(.bold)
                                      .foregroundColor(Color.black)
                            
                        }
                        
                      
                        
                    }.padding()
                    
                }//End List List dictionary
                    
                    
                    if wordPlayMenuToggle {
                        
                        HStack {
                            
                            //Call Word Play
                            
                            NavigationLink(destination: Learning()) {
                            
                            
                            MenuIcon(icon: "book")
                                .foregroundColor(Color.purple)
                            
                                //Icon Legend
                                Text("Learning ")
                                    .foregroundColor(Color.black).fontWeight(.bold)
                                
                            }//End of the Naviagtion Link
                        }
                    }
                
                }//End Icon VStack
            
            
            
            
            
                        Spacer()
                
                        
                        Button(action: {
                            
                           self.showMenuItems()
                            
                        }) {
                            
                            
                            HStack {
                            Image(systemName: "plus.square.on.square")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .foregroundColor(Color.black)
                            
                            Text("Menu").fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                            }.padding()
                    
                        
                    }
        }//VStack
                
            }//View
    
    //Function to show menu items
    func showMenuItems() {
        
       
        
        withAnimation {
        self.menuPlaceHolderTitleToggle.toggle()
        }
        
        
        
        //Toggle Settings
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
           withAnimation {
            self.settingsMenuToggle.toggle()
            
            }
       
        }
        
   
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    
    withAnimation {
        
        self.searchMenuToggle.toggle()
        
            }
        
    }//End Search Dictionary
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.wordPlayMenuToggle.toggle()
            }
        }
        
    }//End Function
}

//MenuItem PreViews
struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem()
    }
}

struct MenuIcon: View {
    
    var icon: String
    
    var body: some View {
        
        //Image Template
        VStack {
            
            Image(systemName: icon)
                .resizable()
                .frame(width:35, height: 35)
                .shadow(color: .black, radius: 0.3, x: 1, y: 1)
            
        }
        
    }
}
