//
//  Movie.swift
//  Filistovich_Ruslan_11.4_wh
//
//  Created by Ruslan on 10/10/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation

struct Movie {
    var name: String
    var rating: String
}

struct GenreMovie {
    var name: String
    var movie: [Movie]
}
