//
//  SearchBar.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-19.
//

import SwiftUI

struct SearchBar: View {
	
	@Binding var searchString: String
	
    var body: some View {
		HStack{
			Image(systemName: "magnifyingglass")
				.foregroundColor(.tropeGray)
			TextField("Search for a recipe...", text: $searchString)
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 20)
			.stroke(Color.tropeGray, lineWidth: 2))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
		SearchBar(searchString: .constant("Chicken"))
    }
}
