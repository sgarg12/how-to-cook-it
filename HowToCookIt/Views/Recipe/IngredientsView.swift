//
//  IngredientsView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-23.
//

import SwiftUI

struct IngredientsView: View {
	var ingredients: [String]
	var measurements: [String]
    var body: some View {
		VStack {
			HStack(alignment: .lastTextBaseline) {
				Text("Ingredients")
					.font(.title3)
					.foregroundColor(.blackGreen)
					.padding(.top, 30)
				Spacer()
				Text("\(ingredients.count) items")
					.font(.callout)
					.foregroundColor(.tropeGray)
			}
			
			ForEach(ingredients.indices, id: \.self) { index in
				HStack(alignment: .center) {
					Text(ingredients[index])
					Spacer()
					Text(measurements[index])
						.multilineTextAlignment(.trailing)
				}
				.foregroundColor(.blackGreen)
				.padding(10)
				.background(.thinMaterial, in: Rectangle())
			}
		}
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
		IngredientsView(ingredients: Recipe.mockData.ingredients, measurements: Recipe.mockData.measurements)
    }
}
