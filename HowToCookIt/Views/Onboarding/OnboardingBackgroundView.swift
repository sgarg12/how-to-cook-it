//
//  OnboardingBackground.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-17.
//

import SwiftUI

import SwiftUI

struct OnboardingBackgroundView: View {

	let backgroundIcons = Ingredient.backgroundIcons
 
  var body: some View {
	ZStack {
		Color.babyBlue
			.ignoresSafeArea()
	  ForEach(backgroundIcons) { ingredient in
		  ingredient.icon
		.resizable()
		.frame(width: 100, height: 100, alignment: .center)
		.position(ingredient.position)
	  }
	}
  }
}


struct OnboardingBackground_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackgroundView()
    }
}
