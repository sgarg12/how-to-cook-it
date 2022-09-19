//
//  MealListScreen.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import SwiftUI

struct MealsListScreen: View {
	
	@StateObject private var mealsListVM = MealsListViewModel()
	let category: CategoryViewModel
	
    var body: some View {
		MealsListView(allMeals: mealsListVM.meals)
			.task {
				await mealsListVM.fetchMealsByCategory(categoryName: category.name)
			}
    }
}

