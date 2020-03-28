//
//  MovieTableViewCell.swift
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    var movie: MDBMovie? {
        didSet {
            guard let movie = movie else {return}
            movieTitleLabel.text = movie.title
            movieOverviewLabel.text = movie.overview
            movieRatingLabel.text = "Rating: \(movie.rating)"
        }
    }
}
