//
//  DataManager.swift
//  ExamProject
//
//  Created by 1234 on 26.05.2023.
//

import Foundation


// View Model
class DataManager: ObservableObject {
    
    // В массивах хранятся данные об изображениях (ссылка)
    @Published var images: [ImageInfo] = []
    @Published var saved: [ImageInfo] = []
    func fetch() {
        // адрес откуда загружаются изображения
        let address = "https://api.unsplash.com/photos/?client_id=T-YLP04X1CBJiHxS17kKdXLZ6_wSa81mb9Wv2zwD0nA&order_by=ORDER&per_page=30"
        
        if let url = URL(string: address) {
            // посылаем запрос на сервер и получаем декодированные данные
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let response = response as? HTTPURLResponse, let data = data {
                    print("Status code: \(response.statusCode)")
                    do {
                        let decoder = JSONDecoder()
                        let picInfo = try decoder.decode([ImageInfo].self, from: data)
                        // сохраняем полученные данные 
                        self.images.append(contentsOf: picInfo)
                    } catch {
                        print(error)
                    }
                }
                
            }.resume()
        }
    }
}
