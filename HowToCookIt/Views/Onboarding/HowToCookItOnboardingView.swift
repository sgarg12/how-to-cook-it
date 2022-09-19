//
//  HowToCookItOnboardingView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-17.
//

import SwiftUI

struct HowToCookItOnboardingView: View {
	
	@State var currentPageIndex = 0

	public init(items: [OnboardingModel]) {
	  self.items = items
	}

	private var onNext: (_ currentIndex: Int) -> Void = { _ in }
	private var onSkip: () -> Void = {}

	private var items: [OnboardingModel] = []

	private var nextButtonTitle: String {
	  items[currentPageIndex].nextButtonTitle
	}
	private var skipButtonTitle: String {
	  items[currentPageIndex].skipButtonTitle
	}
	
	public var body: some View {
	  if items.isEmpty {
		Text("Nothing to show here.")
	  } else {
		  VStack {
			TabView(selection: $currentPageIndex) {
			
			  ForEach(0..<items.count, id: \.self) { index in
				OnboardingView(onboardingModel: items[index])
				  .tag(index)
			  }
			}
			.padding(.bottom, 10)
			.tabViewStyle(.page)
			.indexViewStyle(.page(backgroundDisplayMode: .always))
			.onAppear(perform: setupPageControlAppearance)
			
			Button(action: next) {
			  Text(nextButtonTitle)
				.frame(maxWidth: .infinity, maxHeight: 44)
			}
			.animation(nil, value: currentPageIndex)
			.buttonStyle(OnboardingButtonStyle(color: .blackGreen))

			Button(action: onSkip) {
			  Text(skipButtonTitle)
				.frame(maxWidth: .infinity, maxHeight: 44)
			}
			.animation(nil, value: currentPageIndex)
			.buttonStyle(OnboardingButtonStyle(color: .emerald))
			.padding(.bottom, 20)
		  }
		  .background(OnboardingBackgroundView())
		}
	}
	
	public func onNext(
	  action: @escaping (_ currentIndex: Int) -> Void
	) -> Self {
		var howToCookItOnboardingView = self
	howToCookItOnboardingView.onNext = action
		return howToCookItOnboardingView
	}

	public func onSkip(action: @escaping () -> Void) -> Self {
		var howToCookItOnboardingView = self
	howToCookItOnboardingView.onSkip = action
		return howToCookItOnboardingView
	}

	private func setupPageControlAppearance() {
	  UIPageControl.appearance().currentPageIndicatorTintColor =
		UIColor(.emerald)
	}

	private func next() {
	  withAnimation {
		  currentPageIndex = currentPageIndex + 1 < items.count ?
		  currentPageIndex + 1 :
		  0
	  }
	  onNext(currentPageIndex)
	}

}

struct OnboardingButtonStyle: ButtonStyle {
  let color: Color
  func makeBody(configuration: Configuration) -> some View {
	configuration.label
	  .background(color)
	  .clipShape(Capsule())
	  .buttonStyle(.plain)
	  .padding(.horizontal, 20)
	  .foregroundColor(.white)
  }
}

