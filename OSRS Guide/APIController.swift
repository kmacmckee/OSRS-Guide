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
        request.addValue("query", forHTTPHeaderField: "action")
        request.addValue("prop", forHTTPHeaderField: "revisions")
        request.addValue("rvprop", forHTTPHeaderField: "content")
        request.addValue("titles", forHTTPHeaderField: item)
        
        print(request.allHTTPHeaderFields)
    
        
    }
    
    
    
}
