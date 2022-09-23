//
//  TextHeaderView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-22.
//

import SwiftUI

struct TextHeaderView: View {
	var recipe: Recipe
	@Binding var categoryShown: HeaderCategory
    var body: some View {
		VStack {
			VStack {
				Text(recipe.name)
					.font(.title2)
					.foregroundColor(.blackGreen)
				Text("\(recipe.cuisine) | \(recipe.category)")
					.foregroundColor(.tropeGray)
				Picker("", selection: $categoryShown) {
					Text(HeaderCategory.ingredients.rawValue)
						.tag(HeaderCategory.ingredients)
					Text(HeaderCategory.steps.rawValue)
						.tag(HeaderCategory.steps)
				}
				.pickerStyle(.segmented)
			}
		}
    }
}

enum HeaderCategory: String {
	case ingredients = "Ingredients"
	case steps = "Steps"
}

struct TextHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		TextHeaderView(recipe: Recipe.mockData, categoryShown: .constant(HeaderCategory.ingredients))
	}
}
