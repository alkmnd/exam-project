//
//  SavedListView.swift
//  ExamProject
//
//  Created by 1234 on 26.05.2023.
//

import Foundation
import SwiftUI

// отображение сохраненных ихображений
struct SavedListView: View {
    @StateObject var dataManager:  DataManager
    var body: some View {
        NavigationView {
            List {
                // образаемся к массиву охраненных изображений в можели представления
                ForEach(dataManager.saved, id:\.urls) {
                    image in
                    VStack {
                        URLImage(urlString: image.urls.regular, data: nil)
                        Button{dataManager.saved.append(image)}label: {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
            
        }
    }
}

struct SavedListView_Previews: PreviewProvider  {
    static var previews: some View {
        SavedListView(dataManager: DataManager())
    }
}
