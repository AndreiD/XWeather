//
// Created by dan on 7/29/16.
// Copyright (c) 2016 androidadvance. All rights reserved.
//


import RealmSwift


func realmAndPath() -> Realm {
    if Constants.dev {
        // location of my desktop
        let testRealmURL = NSURL(fileURLWithPath: "/Users/dan/Desktop/TestRealm.realm")
        return try! Realm(fileURL: testRealmURL)
    } else {
        return try! Realm()
    }
}