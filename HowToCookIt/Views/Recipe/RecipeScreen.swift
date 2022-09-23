//
//  RecipeScreen.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import SwiftUI

struct RecipeScreen: View {
	
	@StateObject private var recipeVM = RecipeViewModel()
	@State private var categoryShown: HeaderCategory = .ingredients
	
	let id: String
	let bounds = UIScreen.main.bounds
	
	var body: some View {
		VStack {
			ZStack {
				RecipeHeaderView(resourceURL: recipeVM.recipe.imageURL)
				VStack {
					BackButton()
					Spacer()
				}
			}
			.frame(maxWidth: bounds.width, maxHeight: 250)
			.clipped()
			
			List {
				VStack(alignment: .leading, spacing: 10) {
					TextHeaderView(recipe: recipeVM.recipe, categoryShown: $categoryShown)
					if (categoryShown == .ingredients) {
						IngredientsView(ingredients: recipeVM.recipe.ingredients, measurements: recipeVM.recipe.measurements)
					} else {
						InstructionsView(steps: recipeVM.recipe.instructions)
					}
				}
				.padding(.top)
			}
			.listStyle(.plain)
		}
		.navigationBarHidden(true)
		.ignoresSafeArea()
		.task {
			await recipeVM.fetchRecipeByID(id)
		}
	}
}

struct RecipeScreen_Previews: PreviewProvider {
	static var previews: some View {
		RecipeScreen(id: "52772")
	}
}
