//
//  MealCellView.swift
//  HowToCookIt (iOS)
//
//  Created by Shivangi on 2022-09-11.
//

import SwiftUI

struct MealCellView: View {

	let meal: MealViewModel
	
	var body: some View {
		TileView(imageURL: meal.imgURL, title: meal.name)
	}
}
