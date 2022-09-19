//
//  CategoryListView.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import SwiftUI

struct CategoryListView: View {
	
	let categories: [CategoryViewModel]
	
	var body: some View {
		VStack {
			ScrollView(showsIndicators: false) {
				LazyVStack(alignment: .leading, spacing: 10) {
					ForEach(categories) { category in
						NavigationLink(destination: MealsListScreen(category: category).navigationTitle(category.name)) {
							CategoryCellView(category: category)
						}.buttonStyle(.plain)
					}
				}
			}
		}
		.padding(.horizontal)
		
	}
}
