//
//  CategoryListScreen.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import SwiftUI

struct CategoryListScreen: View {
	
	@StateObject var model: CategoryListViewModel = CategoryListViewModel()
	
	var body: some View {
		NavigationView {
			CategoryListView(categories: model.categoriesList)
				.task {
					await model.fetchCategories()
				}
				.navigationTitle("Categories")
		}
	}
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen()
    }
}
