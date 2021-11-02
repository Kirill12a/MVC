//
//  GetCommentResponse.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import Foundation


struct GetCommentResponse  { // при помощи этой структуры буду получать комментарии и будем заполнять массив коментов
    let comments: [Comment]
    typealias JSON = [String: AnyObject]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else {throw Networkerror.failInternetError}
        
        var comments = [Comment]()
        
        for dictionary in array{
            guard let comment = Comment(dic: dictionary) else {continue}
            comments.append(comment)
        }
        self.comments = comments
        
    }
}
// прием данных закончен
