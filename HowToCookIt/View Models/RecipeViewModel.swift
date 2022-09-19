//
//  RecipeViewModel.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import Foundation

class RecipeViewModel: ObservableObject {
	
	@Published var name: String = ""
	@Published var ingredients: [String] = []
	@Published var measurements: [String] = []
	@Published var imageURL: URL?
	
	func fetchRecipeByID(_ id: String) async {
		do {
			let recipeResponse = try await NetworkManager().get(from: Constants.URLS.recipeByID(id)) { data in
				return try? JSONDecoder().decode(RecipeResponse.self, from: data)
			}
			if let recipe = recipeResponse.meals.first {
				Task { @MainActor in
					self.name = recipe.name
					self.ingredients = recipe.ingredients
					self.measurements = recipe.measurements
					self.imageURL = URL(string: recipe.imageURL)
				}
			}
			
		} catch {
			print(error)
		}
	}
}
