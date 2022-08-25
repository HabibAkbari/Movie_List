//
//  SearchToAPIView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/20/22.
//

import SwiftUI

struct SearchToIMDbAPIView: View {
    
    @State private var searchText = ""
    var body: some View {
        
        NavigationView {
            Text("Search for \(searchText)")
                .searchable(text: $searchText)
                .navigationTitle("Search to IMDB")
            
        }
    }
}

struct SearchToAPIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchToIMDbAPIView()
    }
}
