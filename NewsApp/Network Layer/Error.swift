//
//  Error.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

enum APIError : String, Error {
    case noInternet = "Please check internet connection"
    case notFound = "No data found or page removed"
}
