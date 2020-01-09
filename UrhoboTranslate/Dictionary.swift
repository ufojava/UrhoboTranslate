//
//  Dictionary.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 31/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

/*File to hold 2 classes
 (1) NSManagedObject
 (2) Observable Object
 */

import CoreData
import SwiftUI


//CoreData Managed Class
class Dictionary: NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var englishWord: String
    @NSManaged var urhoboWord:  String
    @NSManaged var imageName:   String
    
    
}


//Observable Words
class DictionaryWord:   ObservableObject {
    
    @Published var id = 0
    @Published var englishWord = ""
    @Published var urhoboWord = ""
    @Published var imageName = ""
    
}

extension Dictionary {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dictionary> {
        
        return NSFetchRequest<Dictionary>(entityName: "Dictionary")
    }
    
    
    var wrappedEnglishWord: String {
          englishWord
      }
      
      var wrappedUrhoboWord: String {
          urhoboWord
      }
    
    
}

