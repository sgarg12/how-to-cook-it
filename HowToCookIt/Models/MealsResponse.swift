//
//  RecipeResponse.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-11.
//

import Foundation

struct MealsResponse: Decodable {
	let meals: [Meal]
}

struct Meal: Decodable {
	let strMeal: String
	let strMealThumb: String
	let idMeal: String
}
