//
//  TileView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-19.
//

import SwiftUI

struct TileView: View {
	let imageURL: URL?
	let title: String
	let bounds = UIScreen.main.bounds
    var body: some View {
		ZStack {
			AsyncImage(url: imageURL) { image in
				image
				.resizable()
				.scaledToFit()
				.overlay(LinearGradient(
					colors: [.black.opacity(0.7),
							 .clear,
							 .black.opacity(0.7)],
					startPoint: .topTrailing,
					endPoint: .bottomLeading))
				.frame(width: bounds.width * 0.85, height: 270)
				.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			}  placeholder: {
				ProgressView()
			   }
			VStack(alignment: .leading) {
				Spacer()
				HStack(alignment: .top) {
					VStack(alignment: .leading, spacing: 20) {
						Text(title)
							.font(.title)
					}
					.frame(maxWidth: bounds.width * 0.7, alignment: .leading)
				}
				.padding()
				.background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20))
			}
			.padding()
		}
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
		TileView(imageURL: URL(string: "www.themealdb.com/images/ingredients/Lime.png"), title: "Lime")
    }
}
