//
//  PostData.swift
//  H4X0R News
//
//  Created by Mauricio Dias on 5/5/21.
//

import Foundation

struct Results: Codable {
    let hits: [Post]
}

//codable to be used on JSon and Identifiable to be used on the List
struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
