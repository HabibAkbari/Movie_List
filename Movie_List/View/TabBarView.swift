//
//  TabView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/16/22.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            
            ListView()
                .tabItem {
                    Label("List", systemImage:"list.star")
                }
            
            BackUpView()
                .tabItem{
                    Label("BackUp", systemImage: "goforward")
                }
            
        }

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
