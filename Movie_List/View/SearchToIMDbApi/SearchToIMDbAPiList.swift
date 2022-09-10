//
//  SearchToAPIView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/20/22.
//

import SwiftUI

struct SearchToIMDbAPiList: View {
    
    @State private var searchText = ""
    @State var searchQuery: String = ""
    var movieTitleSearchList = [MovieO]()
    @State var movieListTitle = [MovieObject]()
    let loadData = LoadData()
    var apikey = "89155805"
    @State private var showingAlert = false
    
    var body: some View {
        
        
        //
        //        VStack {
        //            TextField(" Enter Title movie", text: self.$searchQuery)
        //                .padding(30)
        //                .multilineTextAlignment(.center)
        //            Button(action: {
        //                self.fetchTitleMovie()
        //            }, label: {
        //                Text("Serach")
        //                    .fontWeight(.bold)
        //                    .foregroundColor(.white)
        //                    .padding(20)
        //                    .padding([.leading, .trailing], 30)
        //            })
        //            .background(Color.blue)
        //            .cornerRadius(15)
        
        
        NavigationView {
            
            HStack {
                //                    Text("Search for ")
                //                        .searchable(text: $searchQuery)
                //
                //                        .onSubmit(of: .search){
                //                            self.fetchTitleMovie()
                //                        }
                //
                //                        .navigationTitle("Search to IMDB")
                
                
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
        
        //        NavigationView {
        //
        ////            HStack {
        ////                Text("Search for \(searchText)")
        ////                    .searchable(text: $searchText)
        ////                    .onSubmit {
        ////                        print("Search")
        ////                    }
        ////                    .navigationTitle("Search to IMDB")
        ////
        ////                Button {
        ////
        ////                } label: {
        ////                    Text("OK")
        ////                }
        ////
        ////            }
        //
        //
        //            TextField(" Enter Title movie", text: self.$searchQuery)
        //                .padding(30)
        //                .multilineTextAlignment(.center)
        //            Button(action: {
        //                self.fetchTitleMovie()
        //            }, label: {
        //                Text("Serach")
        //                    .fontWeight(.bold)
        //                    .foregroundColor(.white)
        //                    .padding(20)
        //                    .padding([.leading, .trailing], 30)
        //            })
        //            .background(Color.blue)
        //            .cornerRadius(15)
        //
        //
        //
        //            List {
        //
        //                ForEach(movieListTitle, id: \.imdbID) { movie in
        //
        //
        //                    NavigationLink {
        //
        //                       MovieDetailToIMDbApi()
        //
        //                    } label: {
        //
        //                        SearchToIMDbAPiRow(movie: movie)
        //                    }
        //
        //                }
        //            }
        //            //            .searchable(text: $searchText) {
        //            //
        //            //            }
        //            //.navigationTitle("Search To imdb")
        //            //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        //            //.searchable(text: $searchText)
        //            //.searchable(text: $searchText, placement: .toolbar, prompt: String)
        //            .navigationBarTitle("Search To imdb", displayMode: .large)
        //
        //        }
        //        .onAppear(){
        //            //loadData.fetchTitleMovie()
        //        }
        
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

//                alert("Error", isPresented: $showingAlert) {
//                    Button("Ok", role: .cancel){}
//                }
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
