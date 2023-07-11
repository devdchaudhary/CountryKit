//
//  File.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import SwiftUI

public extension Color {
    
    static let backgroundColor = Color("Background", bundle: .module)
    static let primaryText = Color("primaryText", bundle: .module)
    static let secondaryText = Color("secondaryText", bundle: .module)

}

public extension String {
    
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
 
    var getFlag: String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
}
    
