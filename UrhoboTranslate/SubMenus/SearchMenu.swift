//
//  SearchMenu.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 16/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//File to search Menu
import SwiftUI

struct SearchMenu: View {
    
    //State Menu for List and Search
    @State private var listDictionaryMenuToggle = false
    @State private var searchDictionaryMenuToggle = false
    
    
    
    var body: some View {
    
                
                VStack {
                           
                           ZStack {
                               
                               VStack {
                               
                                       Image("backgroundV2")
                                           .resizable()
                                           .scaledToFill()
                                           
                                       
                                       Button(action: {
                                           
                                           self.showMenu()
                                           
                                       }) {
                                           
                                           Text("Show Menu")
                                           
                                           }
                               
                                   
                              }//VStack End
                
                
                            VStack {
                                
                                if listDictionaryMenuToggle {
                                    
                                    Text("Menu Options 👇🏿👇🏿👇🏿")
                                           .bold()
                                           .font(.headline)
                                    
                                       Spacer().frame(height:30)
                                    
                                    
                                    NavigationLink(destination: ListDictionary()) {
                                        
                                        HStack {
                                        
                                        //Menu Icon
                                        MenuIcon(icon: "list.dash")
                                            .foregroundColor(Color.yellow)
                                        
                                        //Icon Legend
                                        Text("Get Dictionary List")
                                            .foregroundColor(Color.black).fontWeight(.bold)
                                            
                                        
                                        
                                        }//End HStack
                                    }//End Navigation Link
                                    
                                    
                                }//end List If
                                
                            
                                if searchDictionaryMenuToggle {
                                    
                                    NavigationLink(destination: SearchDictionary()) {
                                        
                                        HStack {
                                            
                                            //Menu Icon
                                            MenuIcon(icon: "eyeglasses")
                                                .foregroundColor(Color.blue)
                                                
                                            
                                            //Icon Legend
                                            Text("Srch Dictionary List")
                                                .foregroundColor(Color.black).fontWeight(.bold)
                                            
                                        }
                                        
                                    }
                                }
                                
                            
                            
                            }//End VStack
    
            
            
                    }.padding()
                    
                    .navigationBarTitle(Text("Search Menu"))
                    
        }
            
        
        
    }
    
    
    func showMenu() {
        
        //List Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.listDictionaryMenuToggle.toggle()
            }
        }
        
        //Search Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                
                self.searchDictionaryMenuToggle.toggle()
                
            }
        }
        
    }
}

struct SearchMenu_Previews: PreviewProvider {
    static var previews: some View {
        SearchMenu()
    }
}
