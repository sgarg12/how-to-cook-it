//
//  OnboardingView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-17.
//

import SwiftUI

struct OnboardingView: View {

  let onboardingModel: OnboardingModel

  var body: some View {
	ZStack {
		RoundedRectangle(cornerRadius: 16, style: .continuous)
			.fill(Color.white)
		.shadow(radius: 8)
		.padding(.horizontal, 20)
	  VStack(alignment: .center) {
		VStack {
	
		  Text(onboardingModel.title)
			.foregroundColor(.blackGreen)
			.font(.largeTitle)
			.bold()
			.multilineTextAlignment(.center)
			.padding(.horizontal, 10)

		  Text(onboardingModel.description)
			.foregroundColor(.blackGreen)
			.multilineTextAlignment(.center)
			.padding(.horizontal, 10)
			.padding(.top, 10)

			LottieView(name: onboardingModel.animationJSON, loopMode: .loop)
				.scaledToFit()
		}
		.padding()
	  }
	}
  }
}

