//
//  PlistLoader.swift
//  Directory
//
//  Created by oktay on 26.02.2023.
//

import Foundation

enum pListError: Error {
    case invalidResource
    case parsingFailure
}

class PlistLoader{
    
    static func array(fileName:String, extension_ : String) throws -> [[String : String]] {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: extension_) else {
            throw pListError.invalidResource
        }
        guard let data = NSArray(contentsOfFile: path) as? [[String: String]] else {
            throw pListError.parsingFailure
        }
        return data
    }
}


class ContactSource {
    static var contacts : [ContactModel] {
        let data = try! PlistLoader.array(fileName: "ContactsDB", extension_: "plist")
        return data.compactMap{ ContactModel(data: $0)}
    }
}
