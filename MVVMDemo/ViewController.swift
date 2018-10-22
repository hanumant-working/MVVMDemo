//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Hanumant S on 01/10/18.
//  Copyright © 2018 Hanumant S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var albumTableView: UITableView!
    @IBOutlet var albumModel: AlbumViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        albumModel?.fetchData {
            DispatchQueue.main.async {
                self.albumTableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureCell(cell: albumCell, indexpath: IndexPath) {
        cell.albumNameLabel.text = albumModel?.titleInCellForRowAtIndex(indexPath: indexpath)
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (albumModel?.numberOfRows())!
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell") as! albumCell
        configureCell(cell: cell, indexpath: indexPath)
        return cell
    }
}



class albumCell: UITableViewCell {
    @IBOutlet weak var albumNameLabel: UILabel!
}

