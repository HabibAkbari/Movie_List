//
//  SearchTitleMovieView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/28/22.
//

import SwiftUI

struct SearchToIMDbAPiRow: View {
    
    var movie : MovieObject
    
    
    var body: some View {
        
        
        HStack {
            
            AsyncImage(url: URL(string: movie.Poster)) { poster in
                poster.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                
                Text("\(movie.Title)(\(movie.Year))")
                    .font(.title3)
                
                Spacer()
                
                Text(movie.Type)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        
    }
}

//struct SearchTitleMovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchToIMDbAPiRow()
//            .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
