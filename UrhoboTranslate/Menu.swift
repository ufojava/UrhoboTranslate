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
    @State private var dictionaryInputMenuToggle = false
    @State private var editDictionaryMenuToggle = false
    @State private var listDictionaryMenuToggle = false
    @State private var searchDictionaryMenuToggle = false
    @State private var wordPlayMenuToggle = false
    @State private var menuPlaceHolderTitleToggle = true
    
    
    var body: some View {
       
        VStack {
            
           
                VStack {
                    Spacer().frame(height: 280)
                    
                    if menuPlaceHolderTitleToggle {
                        Text("Urhobo for Beginners 😳")
                            .font(.largeTitle)
                    }
            
            if dictionaryInputMenuToggle {
                
                    //Dictionary
                    HStack {
                        
                        NavigationLink(destination: DictionaryForm()) {
                           
                            MenuIcon(icon: "book")
                                     .foregroundColor(Color.red)
                                   
                            
                                 //Icon Legend
                                 Text("Word(s) Input").fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            
                        }
                        
                        
                    
                    }
                
            }//End dictionary Input
                
                
            if editDictionaryMenuToggle {
                    //Edit Dictionary
                    HStack {
                        
                        //Call Edit Struct
                        NavigationLink(destination: EditDeleteDictionary()) {//Needs new Link
                            
                            MenuIcon(icon: "pencil")
                              .foregroundColor(Color.blue)
                          
                          //Icon Legend
                          Text("Edit Dictionary").fontWeight(.bold)
                              .foregroundColor(Color.black)
                                                  
                            
                        }//End Navgation Link
                      
                    }//End HStack
                
                
            }//End Edit Dictionary
                
            
                if listDictionaryMenuToggle {
                    
                    HStack {
                        
                        //Call List Struct
                        NavigationLink(destination: ListDictionary()) {
                            
                            //Call List Naviation Link
                                  MenuIcon(icon: "list.bullet.below.rectangle")
                                      .foregroundColor(Color.green)
                                  
                                  //Icon Legend
                                  Text("List Dictionary").fontWeight(.bold)
                                      .foregroundColor(Color.black)
                            
                        }
                        
                      
                        
                    }
                    
                }//End List List dictionary
                    
                    
                    
                    if searchDictionaryMenuToggle {
                    
                    HStack {
                        
                        //Call Search Struct
                        NavigationLink(destination: SearchDictionary()) {
                            
                            
                            MenuIcon(icon: "magnifyingglass")
                                .foregroundColor(Color.yellow)
                                
                                //Icon Legennd
                                Text("Srch Dictionary")
                                    .foregroundColor(Color.black).fontWeight(.bold)
                            
                        }
                            
                            
                    }
                    
                    
                    }//End Search Dictionary
                    
                    
                    if wordPlayMenuToggle {
                        
                        HStack {
                            
                            //Call Word Play
                            
                            NavigationLink(destination: WordPlayList()) {
                            
                            
                            MenuIcon(icon: "gamecontroller")
                                .foregroundColor(Color.purple)
                            
                                //Icon Legend
                                Text("Word Dic Play")
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
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.black)
                            
                            Text("Menu").fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                        }
                    
                        
                    }
        }//VStack
                
            }//View
    
    //Function to show menu items
    func showMenuItems() {
        
        withAnimation {
        self.menuPlaceHolderTitleToggle.toggle()
        }
        
        
        //Toggle Dictionary Input
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
           withAnimation {
               self.dictionaryInputMenuToggle.toggle()
            
        }
       
        }
        
        //Toggle Edit Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            withAnimation {
                self.editDictionaryMenuToggle.toggle()
            }
        }
        
        //Toggle List Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation {
                self.listDictionaryMenuToggle.toggle()
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    
    withAnimation {
        
        self.searchDictionaryMenuToggle.toggle()
        
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
                .frame(width:55, height: 55)
                .shadow(color: .black, radius: 0.3, x: 1, y: 1)
            
        }
        
    }
}
