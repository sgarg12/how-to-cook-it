//
//  CategoryListViewModel.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import Foundation

class CategoryListViewModel: ObservableObject {
	
	@Published var categoriesList: [CategoryViewModel] = []
	
	func fetchCategories() async {
		do {
			let categoryResponse = try await NetworkManager().get(from: Constants.URLS.categoriesURL) { data in
				return try? JSONDecoder().decode(CategoryResponse.self, from: data)
			}
			
			Task { @MainActor in
				self.categoriesList = categoryResponse.categories.map(CategoryViewModel.init)
			}
			
			
		} catch {
			print(error)
		}
		
	}
}

struct CategoryViewModel: Identifiable {
	let id: String
	private let category: Category
	
	init(_ category: Category){
		self.id = category.idCategory
		self.category = category
	}
	
	var name: String {
		category.strCategory
	}
	
	var imgURL: URL? {
		URL(string: category.strCategoryThumb)
	}
}
