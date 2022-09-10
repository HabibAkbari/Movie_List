//
//  LoadData.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/31/22.
//

import Foundation
import SwiftUI

struct LoadData {
    
    @State var searchQuery: String = "Crash"
   // @State var movieListTitle = [MovieO]()
    var apikey = "89155805"
//    @State var movieListTitleObject = [MovieObject]()
//    @State var movieList = [MovieObject]()
   
    @State var movieListTitleNew = [MovieObject]()

    
    func fetchTitleMovie(titleMovie:String) {
//
//        guard let url = URL(string:  "https://www.omdbapi.com/?i=tt3896198&apikey="+apikey+"&s="+self.searchQuery)
//        else {
//            return
//        }
//        print(url)
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        print(request)
//        URLSession.shared.dataTask(with: request){ (data, response, error) in
//
//            guard let data = data else { return }
//            print("count data\(data.count)")
//
//            do {
//
//                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
//
//                        if (statusCode == 200) {
//
//                            let finalData = try JSONDecoder().decode(IMDBSearchTitleResponse.self, from: data)
//                            print(finalData)
//                            self.movieListTitle = finalData.SearchTitle
//                            print(self.movieListTitle)
//
//                        }
//            } catch {
//                print(error)
//                //self.loading = false
//            }
//       }.resume()
    
    
    guard let url = URL(string:  "https://www.omdbapi.com/?i=tt3896198&apikey="+apikey+"&s="+titleMovie)
    else {
        return
    }
    print(url)
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    print(request)
    URLSession.shared.dataTask(with: request){ (data, response, error) in
        
        guard let data = data else { return }
        print("count data\(data.count)")

        do {
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
            
                    if (statusCode == 200) {
                        
                        let finalData = try JSONDecoder().decode(IMDBSearchResponse.self, from: data)
                        print("finalData:\(finalData)")
                        let serach = finalData.Search
                        movieListTitleNew = finalData.Search
                       
                        print("self.movieListTitleNew:\(movieListTitleNew)")
                        
                    }
        } catch {
            print(error)
           
        }
   }.resume()
        
    }
    
}



