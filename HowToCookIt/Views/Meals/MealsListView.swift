//
//  MealsListView.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import SwiftUI

struct MealsListView: View {
	
	@State private var searchString = ""
	
	let allMeals: [MealViewModel]
	
	var meals: [MealViewModel] {
		return searchString.isEmpty ?
		allMeals :
		allMeals
			.filter {
				$0
					.name
					.lowercased()
					.contains(searchString.lowercased())
			}
	}
	
	var body: some View {
		
		VStack {
			SearchBar(searchString: $searchString)
			ScrollView(showsIndicators: false) {
				LazyVStack(alignment: .leading, spacing: 10) {
					ForEach(meals, id: \.id) { meal in
						NavigationLink(destination: RecipeScreen(id: meal.id).navigationTitle(meal.name)) {
							MealCellView(meal: meal)
						}
						.buttonStyle(.plain)
					}
				}
			}
		}
		.animation(.easeInOut, value: searchString)
		.padding(.horizontal)
		
	}
}
