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
        
        //Dictionary Input Form
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                self.dictionaryInputMenuToggle.toggle()
            
            }
        }
        
        //Edit Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
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





