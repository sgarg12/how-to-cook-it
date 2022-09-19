//
//  HowToCookItApp.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-19.
//

import SwiftUI

@main
struct HowToCookItApp: App {
	
	@AppStorage(AppUserDefaults.onboarding)
	  var shouldPresentOnboarding = true

	var onboardingModels: [OnboardingModel] {
	  [
		OnboardingModel(
		  title: "How to Cook It?",
		  description:
			"Looking for a recipe for your next meal? Then you have found the perfect app!",
		  animationJSON: "WelcomeScreen"
		),
		OnboardingModel(
		  title: "Search...",
		  description:
			"Search from a long list of the recipes to find the best one for you.",
		  animationJSON: "SearchScreen"
		),
		OnboardingModel(
		  title: "Filter",
		  description:
			"Filter based on various categories to quickly refine your search",
		  animationJSON: "FilterScreenOnBoarding",
		  skipButtonTitle: "Done"
		)
	  ]
	}
	
    var body: some Scene {
        WindowGroup {
			CategoryListScreen()
				.fullScreenCover(isPresented: $shouldPresentOnboarding, onDismiss: nil) {
					
					HowToCookItOnboardingView(items: onboardingModels)
						.onSkip {
							shouldPresentOnboarding = false
						}
				}
        }
    }
}
