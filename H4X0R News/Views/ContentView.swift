//
//  ContentView.swift
//  H4X0R News
//
//  Created by Mauricio Dias on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    
    //@ObjeservedObject is a listener of an ObjservableOBject
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            //trailing closure applied
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

