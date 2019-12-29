//
//  MyMoviesTableViewCell.swift
//  MyMovies
//
//  Created by Joe Thunder on 12/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hasWatchedButton: UIButton!
    
    let movieController = MovieController()
    
    var movie: Movies?
   
    
 
    
    func updateViews() {
        guard let movie = movie else { return }
            self.titleLabel.text = movie.title
            let status = self.movieController.convertToString(status: movie.hasWatched)
            self.hasWatchedButton.titleLabel?.text = status
    }
    
    @IBAction func hasWatchedButtonPressed(_ sender: UIButton) {
        updateWatchStatus()
    }
    
    func updateWatchStatus() {
        guard let movie = self.movie, let title = self.movie?.title, let identifier = self.movie?.identifier, let hasWatched = self.hasWatchedButton.titleLabel?.text else { return }
            let status = self.movieController.convertToBool(status: hasWatched)
             let toggle = self.movieController.toggleStatus(status: hasWatched)
             self.hasWatchedButton.titleLabel?.text = toggle
            self.movieController.update(movie: movie, with: title, identifier: identifier, hasWatched: status)

    
    }
    
}
