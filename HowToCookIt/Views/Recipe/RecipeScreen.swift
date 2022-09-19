//
//  RecipeScreen.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import SwiftUI

struct RecipeScreen: View {
	
	@StateObject private var recipeVM = RecipeViewModel()
	let id: String
	let bounds = UIScreen.main.bounds
	
	var body: some View {
		VStack(alignment: .leading) {
			AsyncImage(url: recipeVM.imageURL) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: bounds.width - 20)
					.clipShape(RoundedRectangle(
						cornerRadius: 10.0,
						style: .continuous)
					)
			}
		placeholder: {
			ProgressView()
		}
		.padding(.bottom, 20)
			
			ForEach(recipeVM.ingredients.indices, id: \.self) { index in
				HStack{
					Text(recipeVM.measurements[index])
					Text(recipeVM.ingredients[index])
				}
			}
			
			Spacer()
		}
		.padding()
		.task {
			await recipeVM.fetchRecipeByID(id)
		}
	}
}

