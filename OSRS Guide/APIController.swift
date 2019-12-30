//
//  APIController.swift
//  OSRS Guide
//
//  Created by Kobe McKee on 12/30/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
class APIController {
    
    let baseURL = URL(string: "https://oldschool.runescape.wiki/api.php")!
    
    init() {
        searchItem(item: "Abyssal")
    }
    
    
    func searchItem(item: String) {
     
        var request = URLRequest(url: baseURL)
        
        //addValue? appendPathComponent?
        request.addValue("query", forHTTPHeaderField: "action")
        request.addValue("prop", forHTTPHeaderField: "revisions")
        request.addValue("rvprop", forHTTPHeaderField: "content")
        request.addValue("titles", forHTTPHeaderField: item)
        
        
        //print(request.allHTTPHeaderFields)
    
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                NSLog("Error running dataTask: \(error)")
                print(error)
            }
            
            guard let data = data else {
                NSLog("No data returned")
                print("No data returned")
                return
            }
            
            print(String(decoding: data, as: UTF8.self))
            
            do {
                let myData = try JSONDecoder().decode(Data.self, from: data)
                
                print(myData)
                
                
            } catch {
                NSLog("Error decoding data: \(error)")
                print(error)
            }
        }.resume()
        
        
    }
    
    
    
}
