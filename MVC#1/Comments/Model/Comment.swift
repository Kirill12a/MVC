//
//  Comment.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import Foundation

struct Comment {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    init?(dic:[String: AnyObject]) {
        guard  let postId = dic["postId"] as? Int,
               let id = dic["id"] as? Int,
               let name = dic["name"] as? String,
               let email = dic["email"] as? String,
               let body = dic["body"] as? String
        else {
            return nil
        }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}

/*
 Создал Failable Initializers, потому что когда работаю с модельками, они могут приходить в разных видах => если мы не может создать модель нашего прототипа, то return nil. Поэтому извлекаем все значения через guard и после того, как я все это получил присваиваем это нашей модели
 */

