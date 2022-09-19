//
//  CategoryResponse.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-10.
//

import Foundation

struct CategoryResponse: Decodable {
	let categories: [Category]
}

struct Category: Decodable {
	let idCategory: String
	let strCategory: String
	let strCategoryThumb: String
	let strCategoryDescription: String
}
