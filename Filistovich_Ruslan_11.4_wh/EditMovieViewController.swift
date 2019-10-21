//
//  EditViewController.swift
//  Filistovich_Ruslan_11.4_wh
//
//  Created by Ruslan on 10/10/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class EditMovieViewController: UIViewController {
    weak var delegat: EditMovieRatingDelegate?
    var movie: Movie!
    var indexMovieInArray: IndexPath!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = movie.name
        rateLabel.text = movie.rating
    }
    @IBAction func buttonAction(_ sender: Any) {
        if rateTextField.text?.isEmpty == true {
            movie.rating = rateLabel.text ?? "nil"
        } else {
            movie.rating = rateTextField.text ?? "nil"
            rateLabel.text = movie.rating
        }
        delegat?.editMovieRatinf(movie: movie, indexMovieInGenreMovies: indexMovieInArray)
        self.navigationController?.popViewController(animated: true)
    }
}
