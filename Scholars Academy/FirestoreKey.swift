//
//  FirestoreKey.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 22/02/2022.
//

import Foundation

class FirestoreKey{
    let studentsCollection = "StudentList"
    //
    var firstName = "firstName"
    var lastName = "lastName"
    var email = "email"
    var jNumber = "jNumber" // if j# is J00123456 then jNumber is 123456
    var firebaseUID = "userID" // id used for linking with the person's Account
    var isAdmin = "isAdmin" // set to true if the user has administrative priviledges
    var isStudent = "isStudent"
    var isMentor = "isMentor"
}
