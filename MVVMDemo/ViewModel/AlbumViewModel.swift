//
//  AlbumViewModel.swift
//  MVVMDemo
//
//  Created by Hanumant S on 01/10/18.
//  Copyright © 2018 Hanumant S. All rights reserved.
//

import UIKit

class AlbumViewModel: NSObject {
    
    @IBOutlet var album: albumService!
    var getData: [NSDictionary]?
    
    func fetchData( completion:@escaping () -> Void) {
        album.albumClient { [weak self] (albumData)  in
            print(albumData)
            self?.getData = albumData
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return getData?.count ?? 0
    }
    
    func titleInCellForRowAtIndex(indexPath: IndexPath) -> String {
        return getData?[indexPath.row].value(forKey: "name") as? String ?? ""
    }
    
}
