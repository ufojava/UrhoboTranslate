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
    
    
    var body: some View {
       
        VStack {
            
            if dictionaryInputMenuToggle {
                VStack {
                    Spacer().frame(height: 280)
                    
                    //Dictionary
                    HStack {
                        MenuIcon(icon: "book")
                            .foregroundColor(Color.red)
                          
                   
                        //Icon Legend
                        Text("Word(s) Input").fontWeight(.bold)
                    
                    }
                
            }//End dictionary Input
                
                
            if editDictionaryMenuToggle {
                    //Edit Dictionary
                    HStack {
                        MenuIcon(icon: "pencil")
                            .foregroundColor(Color.blue)
                        
                        //Icon Legend
                        Text("Edit Dictionary").fontWeight(.bold)
                        
                    }
            }//End Edit Dictionary
                
            
                if listDictionaryMenuToggle {
                    
                    HStack {
                        MenuIcon(icon: "list.bullet.below.rectangle")
                            .foregroundColor(Color.green)
                        
                        //Icon Legend
                        Text("List Dictionary").fontWeight(.bold)
                        
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
                            
                            Text("Menu").fontWeight(.bold)
                            
                        }
                    
                        
                    }
        }//VStack
                
            }//View
    
    //Function to show menu items
    func showMenuItems() {
        
        //Toggle Dictionary Input
        withAnimation {
            self.dictionaryInputMenuToggle.toggle()
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
