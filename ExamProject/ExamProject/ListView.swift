//
//  ListView.swift
//  ExamProject
//
//  Created by 1234 on 26.05.2023.
//

import Foundation
import SwiftUI

// отображение изображения
struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 90)
        } else {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 80)
                                        .onAppear() {
                                            fetchData()
                                        }
        }
    }
    
    // получаем изображение с помощью ссылки
    func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, _ in
            self.data = data
            
        }
        task.resume()
    }
}
struct ListView: View {
    
    //экземпляр модели представления
    @StateObject var dataManager:  DataManager
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.images, id:\.urls) {
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
    
            .onAppear {dataManager.fetch()}
        }
    }
}

struct ListView_Previews: PreviewProvider  {
    static var previews: some View {
        ListView(dataManager: DataManager())
    }
}
