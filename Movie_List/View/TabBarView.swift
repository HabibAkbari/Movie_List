//
//  TabView.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/16/22.
//

import SwiftUI


struct TabBarView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.backGroundColorTabBar)
        UITabBar.appearance().backgroundColor = UIColor(Color.backGroundColorTabBar)
    }
    
    var body: some View {
        
        TabView {
            
            ListView()
                .tabItem {
                    Label("List", systemImage:"list.star")
                }
            
            SearchToIMDbAPIView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            BackUpView()
                .tabItem{
                    Label("BackUp", systemImage: "goforward")
                }
            
        }
        .accentColor(Color.textColorTabBar)
        

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
