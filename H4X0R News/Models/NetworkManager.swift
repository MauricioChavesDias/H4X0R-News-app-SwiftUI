//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Mauricio Dias on 5/5/21.
//

import Foundation

//ObservableObject broadcast one or many of its properties to many interested parties.
//Share all of its properties to classes interested
class NetworkManager: ObservableObject {
    
    //@Published the properties to interested parties
    @Published var posts = [Post]()
    
    func fetchData(){
        //optinal binding because URL can return an optional
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    //optional binding because data is optional
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    
    
}
