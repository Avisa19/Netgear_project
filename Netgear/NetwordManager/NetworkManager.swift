//
//  NetworkManager.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit

final public class NetWorkManager {
    
    static let shared = NetWorkManager()
    
    // Fetch the manifest
    public func getManifestData(name: String, comletionHanlder: @escaping ([[String]]?, Error?) -> Void) {
        
        let headers = [
            "X-API-KEY": "33626b03-88b8-4c6e-af34-ac4e6f7faa7c"
        ]
        
        guard let url = URL(string: "https://afternoon-bayou-28316.herokuapp.com/\(name)") else { return }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                comletionHanlder(nil, error)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse)
                }
            }
            
            // Parse JSON data
            if let data = data {
                let manifests = self.parseJsonData(data: data)
                comletionHanlder(manifests, nil)
                
                
            }
        })
        
        dataTask.resume()
        
        
    }
    
    fileprivate func parseJsonData(data: Data) -> [[String]] {
        
        var manifests = [[String]]()
        
        let decoder = JSONDecoder()
        
        do {
            let loanDataStore = try decoder.decode(Manifest.self, from: data)
            manifests = loanDataStore.manifest
            
        } catch {
            print(error)
        }
        
        return manifests
    }
    
    // Fetch Image Detail
    func getImageDetail(name: String, comletionHanlder: @escaping (NetImage?, Error?) -> Void) {
        
        let headers = [
            "X-API-KEY": "33626b03-88b8-4c6e-af34-ac4e6f7faa7c"
        ]
        
        guard let url = URL(string: "https://afternoon-bayou-28316.herokuapp.com/image/\(name)") else { return }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                comletionHanlder(nil, error)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse)
                }
            }
            
            // Parse JSON data
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let netImage = try decoder.decode(NetImage.self, from: data)
                    comletionHanlder(netImage, nil)
                    
                } catch {
                    print(error)
                }
                
            }
        })
        
        dataTask.resume()
        
        
    }
    
    
}
