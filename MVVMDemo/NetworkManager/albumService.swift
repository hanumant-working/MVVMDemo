//
//  albumService.swift
//  MVVMDemo
//
//  Created by Hanumant S on 01/10/18.
//  Copyright © 2018 Hanumant S. All rights reserved.
//

import UIKit
import Foundation


class albumService: NSObject {
    
    func albumClient(completion: @escaping ([NSDictionary]?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        let session = URLSession.shared
        let sessionTask = session.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            if (error != nil) {
               // completion(nil)
                return
            }
            
            let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
            let albumData = jsonData.value(forKeyPath: "feed.results") as! [NSDictionary]
            completion(albumData)
        }
        sessionTask.resume()
    }
}
