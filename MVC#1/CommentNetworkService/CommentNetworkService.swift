//
//  CommentNetworkService.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import Foundation

// это будет абстрактный класс, который будет вызывать метод
class CommentNetworkService{
    
    private init(){}
    /// когда мы вызвыаем данный метод,я должен получить объект, который должен заполнить массив коментариев.
    ///GetCommentResponse Благодаря этому типу мы получим комментарии назад
    
    /// - Parameter comletion: в параметре стоит тип объекта
    /// - Returns: nil
    static func getComments(comletion: @escaping (GetCommentResponse)->()){ //
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {
            return
        }
        NetworkService.shared.getData(url: url) { (json) in // Нужно это распространить, чтобы заполнился некий массив комментариев 
            do{
                let response = try GetCommentResponse(json: json)
                comletion(response) // передаем дальше
            }catch{
                print(error)
            }
        }
    }
}
