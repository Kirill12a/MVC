//
//  NettworkService.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import Foundation

// Это общий менеджер, который не знает по какому адресу он будет обращаться
class NetworkService{
    private init() {}// этот класс сделаем singltone
    static let shared = NetworkService()
    
    // данные будут передаваться дальше, поэтому completion
    public func getData(url: URL, completion: @escaping (Any) -> ()){
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data  else {return} // проверяем пришли ли нам данные
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json) // передали код дальше
                }
//                print(json)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}

