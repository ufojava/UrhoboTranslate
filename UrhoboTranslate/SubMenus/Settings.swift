//
//  Settings.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 16/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

/* Sub Menu to call
 (1) Add to Urhobo Dictionary
 (2) Edit Dictionary
*/
import SwiftUI


struct Settings: View {
    
//Settings Variable
@State private var settingsImageMenuToggle = true
@State private var dictionaryInputMenuToggle = false
@State private var editDictionaryMenuToggle = false
    
    
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
                    
                    
                    //Insert Settings image
                    if settingsImageMenuToggle {
                        
                        VStack {
                        Spacer().frame(height:300)
                        
                        Image("setting")
                        .resizable()
                        .scaledToFill()
                        .frame(width:180, height:180)
                        //.shadow(radius: 3.0)
                        
                        }.transition(.scale)
                        Spacer().frame(height:60)
                        
                        //Menu Options
                        Text("Menu 👇🏿👇🏿👇🏿")
                               .bold()
                               //.font(.headline)
                               .foregroundColor(Color.green)
                               .font(.system(size:20))
                        Spacer()
                        
                    }
                
                    //Dictionary Icon
                    if dictionaryInputMenuToggle {
                        
                        //Menu Options
                        Text("Menu Options 👇🏿👇🏿👇🏿")
                               .bold()
                               .font(.headline)
                        
                           Spacer().frame(height:30)
                        
                        NavigationLink(destination: DictionaryForm()) {
              
                             HStack {
                               MenuIcon(icon: "book")//MenuIcon is in the Menu Swift File
                                    .foregroundColor(Color.red)
                              
                       
                              //Icon Legend
                              Text("Word(s) Input").fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                
                        }//End HStack
                    }//End Navigation Link
                                           
                }//End If Statement
                
                
                
                        //Edit Dictionary Icon
                        if editDictionaryMenuToggle {
                            
                            NavigationLink(destination: EditDeleteDictionary()) {
                                
                        HStack {
                                
                                MenuIcon(icon: "pencil")
                                    .foregroundColor(Color.blue)
                                
                                //Icon Legend
                                Text("Edit Dictionary").fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            
                            
                            }//End HStack
                        }//End Navigation Link
                
                }//End If Statement
                
                
                }
                
                
                }.padding()//End ZStack
        
                    
        .navigationBarTitle(Text("Settings Menu"))
            
            
            
        }
    }
    
    func showMenu() {
        
        //Toggle the Picture image
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.settingsImageMenuToggle.toggle()
            }
        }
        
        //Dictionary Input Form
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                self.dictionaryInputMenuToggle.toggle()
            
            }
        }
        
        //Edit Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation {
                self.editDictionaryMenuToggle.toggle()
            }
        }
        
        
    }
    
    
}






//Settings Previews
struct Settings_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Settings()
        
    }
}





