//
//  ViewController.swift
//  Filistovich_Ruslan_11.4_wh
//
//  Created by Ruslan on 10/10/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

protocol EditMovieRatingDelegate: class {
    func editMovieRatinf(movie: Movie, indexMovieInGenreMovies: IndexPath)
}

class MovieViewController: UIViewController {
    let idCellMovie = "Cell"
    @IBOutlet weak var movieTable: UITableView!
    
    var genreMovies: [GenreMovie] = [
        GenreMovie(name: "Thriller", movie: [
            Movie(name: "Кино 1", rating: "5"),
            Movie(name: "Кино 2", rating: "5"),
            Movie(name: "Кино 3", rating: "5")
        ]),
        GenreMovie(name: "Сomedy", movie: [
            Movie(name: "Кино 4", rating: "5"),
            Movie(name: "Кино 5", rating: "5"),
            Movie(name: "Кино 6", rating: "5")
        ]),
        GenreMovie(name: "Drama", movie: [
            Movie(name: "Кино 7", rating: "5"),
            Movie(name: "Кино 8", rating: "5"),
            Movie(name: "Кино 9", rating: "5")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: idCellMovie)
        
    }
    
    //MARK: УДАЛЕНИЕ ЯЧЕЕК
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            genreMovies[indexPath.section].movie.remove(at: indexPath.row)
            movieTable.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genreMovies.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return genreMovies[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreMovies[section].movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCellMovie) as? MovieTableViewCell
        cell?.nameLabel.text = genreMovies[indexPath.section].movie[indexPath.row].name
        cell?.rateLabel.text = genreMovies[indexPath.section].movie[indexPath.row].rating
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "EditMovieViewController") as? EditMovieViewController else {  return }
        vc.delegat = self
        vc.movie = genreMovies[indexPath.section].movie[indexPath.row]
        vc.indexMovieInArray = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MovieViewController: EditMovieRatingDelegate {
    func editMovieRatinf(movie: Movie, indexMovieInGenreMovies: IndexPath) {
    genreMovies[indexMovieInGenreMovies.section].movie[indexMovieInGenreMovies.row].rating = movie.rating
        movieTable.reloadData()
    }
    
    
}
