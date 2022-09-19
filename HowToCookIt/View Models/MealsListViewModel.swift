//
//  RecipeListViewModel.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import Foundation

class MealsListViewModel: ObservableObject {
	
	@Published var meals: [MealViewModel] = [MealViewModel]()
	
	func fetchMealsByCategory(categoryName: String) async {
		do {
			let mealsResponse = try await NetworkManager().get(
				from: Constants.URLS
				.mealsByCategoryURL(
					categoryName
				),
				decode: { data in
				return try? JSONDecoder().decode(MealsResponse.self, from: data)
			})
			Task { @MainActor in
				self.meals = mealsResponse.meals.map(MealViewModel.init)
			}
		} catch {
			print(error)
		}
	}
}

struct MealViewModel: Identifiable {
	let id: String
	private let meal: Meal
	
	init(_ meal: Meal) {
		self.id = meal.idMeal
		self.meal = meal
	}

	var name: String {
		meal.strMeal
	}
	var imgURL: URL? {
		URL(string: meal.strMealThumb)
	}
}
