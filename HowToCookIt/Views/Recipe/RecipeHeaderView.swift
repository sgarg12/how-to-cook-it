//
//  RecipeHeaderView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-22.
//

import SwiftUI
import AVKit

struct RecipeHeaderView: View {

	var resourceURL: String
	
    var body: some View {
		AsyncImage(url: URL(string: resourceURL)) { image in
			image
			   .resizable()
			   .scaledToFill()
			   .overlay(LinearGradient(
				   colors: [.black.opacity(0.5),
							.clear,
							.black.opacity(0.5)],
				   startPoint: .topLeading,
				   endPoint: .bottomTrailing))
			   .frame(width: UIScreen.main.bounds.width, height: 200)
		   }  placeholder: {
			   ProgressView()
			  }
    }
}

struct RecipeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		RecipeHeaderView(resourceURL: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
    }
}
