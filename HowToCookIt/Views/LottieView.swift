//
//  LottieView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-17.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
	
	typealias UIViewType = UIView
	
	var name: String = ""
	var loopMode: LottieLoopMode = .playOnce
	
	func makeUIView(context: Context) -> UIView {
		let view = UIView(frame: .zero)
		let animationView = AnimationView()
		animationView.animation = Animation.named(name)
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = loopMode
		animationView.play()
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(animationView)
		
		NSLayoutConstraint.activate([
			animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
			animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])
		
		return view
	}
	
	func updateUIView(_ uiView: UIView, context: Context) {}
	
}
