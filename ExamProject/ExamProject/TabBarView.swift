//
//  TabBarView.swift
//  ExamProject
//
//  Created by 1234 on 26.05.2023.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @StateObject var dataManager = DataManager()
    var body: some View {
        TabView {
            ListView(dataManager: dataManager)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            
            SavedListView(dataManager: dataManager)
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Saved")
                }
        }
    }
}
struct TabBarView_Previews: PreviewProvider  {
    static var previews: some View {
        TabBarView()
    }
}

