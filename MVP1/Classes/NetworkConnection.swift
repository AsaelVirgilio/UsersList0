//
//  NetworkConnection.swift
//  MVP1
//
//  Created by Asael Virgilio on 10/04/23.
//

import Foundation

class NetworkConnection{
    
    func getInfo( _ handler: @escaping(([User]) -> Void)){
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
//            do{
            guard let response = try? JSONDecoder().decode([User].self, from: data) else { return }
            handler(response)
//            }
//            catch{
//                print(error)
//            }
        }.resume()
    }
}
