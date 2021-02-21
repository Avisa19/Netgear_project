//
//  CustomImageView.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit



let imageCache = NSCache<NSString, UIImage>()

// To fetch Images , And for reloading again use cache

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = "https" + urlString.dropFirst(4)
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: "https" + urlString.dropFirst(4) as NSString) {
            self.image = imageFromCache
            return
        }
        
        let headers = [
            "X-API-KEY": "33626b03-88b8-4c6e-af34-ac4e6f7faa7c"
        ]
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                
                if self.imageUrlString == "https" + urlString.dropFirst(4) {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: ("https" + urlString.dropFirst(4)) as NSString)
            }
        }).resume()
        
        
        
    }
    
}

