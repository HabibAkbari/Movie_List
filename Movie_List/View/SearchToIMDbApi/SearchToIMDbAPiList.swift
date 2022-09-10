//
//  SearchToAPIView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/20/22.
//

import SwiftUI

struct SearchToIMDbAPiList: View {
    
    @State var searchQuery: String = ""
    @State var movieListTitle = [MovieObject]()
    let loadData = LoadData()
    var apikey = "89155805"
    
    
    var body: some View {
        
        
        NavigationView {
            
            HStack {
                
                
                List {
                    
                    ForEach(movieListTitle, id: \.imdbID) { movie in
                        
                        
                        NavigationLink {
                            
                            MovieDetailToIMDbApi()
                            
                        } label: {
                            
                            SearchToIMDbAPiRow(movie: movie)
                        }
                        
                    }
                }
                
            }
            .searchable(text: $searchQuery)
            
            .onSubmit(of: .search){
                self.fetchTitleMovie()
            }
            
            .navigationTitle("Search to IMDB")
            
            
            
        }

        
    }
    
    func fetchTitleMovie() {
        
        guard let url = URL(string:  "https://www.omdbapi.com/?i=tt3896198&apikey="+apikey+"&s="+self.searchQuery)
        else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
                
                        if (statusCode == 200) {
                            
                            let finalData = try JSONDecoder().decode(IMDBSearchResponse.self, from: data)
                            self.movieListTitle = finalData.Search

                        }
            } catch {

                print(error)
                
            }
                
       }.resume()
        
    }
}

struct SearchToAPIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchToIMDbAPiList()
    }
}
