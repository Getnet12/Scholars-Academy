//
//  File.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 23/02/2022.
//

import Foundation

class Person{
    var firstName: String?
    var lastName: String?
    var email: String?
    var jNumber: Int? // if j# is J00123456 then jNumber is 123456
    var firebaseUID: String? // id used for linking with the person's Account
    var isAdmin = false // set to true if the user has administrative priviledges
    var isStudent = false
    var isMentor = false
    
    
}
