//
//  Constants.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import Foundation

struct Constants {
	
	struct URLS {
		static let categoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
		static func mealsByCategoryURL(_ name: String) -> URL {
			return URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(name)")!
		}
		static func recipeByID(_ id: String) -> URL {
			return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
		}
	}
}
