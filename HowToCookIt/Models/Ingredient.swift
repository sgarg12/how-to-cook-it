//
//  Ingredient.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-17.
//

import Foundation
import SwiftUI

struct Ingredient: Identifiable {
  let id = UUID()
  let icon: Image
  let position: CGPoint
}

extension Ingredient {
  static let backgroundIcons: [Ingredient] = {
	let bounds = UIScreen.main.bounds
	return [
	  Ingredient(icon: .apple,
		position: .init(x: bounds.minX + 50, y: 20)),
	  Ingredient(icon: .beans,
		position: .init(x: bounds.maxX, y: bounds.maxY / 2)),
	  Ingredient(icon: .blueberries,
		position: .init(x: bounds.maxX, y: bounds.maxY - 100)),
	  Ingredient(icon: .cheese,
		position: .init(x: bounds.minX, y: bounds.maxY / 3)),
	  Ingredient(icon: .cupcake,
		position: .init(x: bounds.minX, y: bounds.maxY / 1.5)),
	  Ingredient(icon: .pizza,
		position: .init(x: bounds.maxX - 50, y: 50)),
	  Ingredient(icon: .meat,
		position: .init(x: bounds.minX + 30, y: bounds.maxY - 50))
	]
  }()
}
