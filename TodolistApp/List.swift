//
//  List.swift
//  TodolistApp
//
//  Created by JillOU on 2020/8/19.
//  Copyright © 2020 Jillou. All rights reserved.
//

import Foundation
struct List:Codable{
    var title:String
    var detail:String
    
    static func saveToFile(lists:[List]){
        let propertylistencoder = PropertyListEncoder()
        if let data = try? propertylistencoder.encode(lists){
            let userDefault = UserDefaults.standard
            userDefault.set(data, forKey: "lists")
        }
    }
    static func readFromFile() -> [List]?{
        let userDefault = UserDefaults.standard
        let propertylistdecoder = PropertyListDecoder()
        if let data = userDefault.data(forKey: "lists"), let lists = try? propertylistdecoder.decode([List].self, from: data){
            return lists
        }else{
            return nil
        }
    }
}
