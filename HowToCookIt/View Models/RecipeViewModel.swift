//
//  RecipeViewModel.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import Foundation

class RecipeViewModel: ObservableObject {
	
	@Published var recipe: Recipe = Recipe()
	
	func fetchRecipeByID(_ id: String) async {
		do {
			let recipeResponse = try await NetworkManager().get(from: Constants.URLS.recipeByID(id)) { data in
				return try? JSONDecoder().decode(RecipeResponse.self, from: data)
			}
			if let recipe = recipeResponse.meals.first {
				Task { @MainActor in
					self.recipe = recipe
				}
			}
			
		} catch {
			print(error)
		}
	}
}
