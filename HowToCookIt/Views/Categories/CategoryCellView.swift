//
//  CategoryCellView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-10.
//

import SwiftUI

struct CategoryCellView: View {
	
	let category: CategoryViewModel
	
    var body: some View {
		TileView(imageURL: category.imgURL, title: category.name)
    }
}

