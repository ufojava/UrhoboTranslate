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
                        MenuIcon(icon: "pencil")
                            .foregroundColor(Color.blue)
                        
                        //Icon Legend
                        Text("Edit Dictionary").fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                    }
            }//End Edit Dictionary
                
            
                if listDictionaryMenuToggle {
                    
                    HStack {
                        MenuIcon(icon: "list.bullet.below.rectangle")
                            .foregroundColor(Color.green)
                        
                        //Icon Legend
                        Text("List Dictionary").fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                    }
                    
                }//End List List dictionary
                
             
                
                
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
           withAnimation {
               self.dictionaryInputMenuToggle.toggle()
            
        }
       
        }
        
        //Toggle Edit Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation {
                self.editDictionaryMenuToggle.toggle()
            }
        }
        
        //Toggle List Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                self.listDictionaryMenuToggle.toggle()
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
