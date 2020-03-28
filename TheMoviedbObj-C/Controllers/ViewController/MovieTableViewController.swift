//
//  MovieTableViewController.swift
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies: [MDBMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
    

    

}
