//
//  RecipeResponse.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-11.
//

import Foundation

struct RecipeResponse: Decodable {
	let meals: [Recipe]
}
struct Recipe: Decodable {
	
	private struct DynamicCodingKeys: CodingKey {
		var stringValue: String
		init?(stringValue: String) {
			self.stringValue = stringValue
			let int = stringValue.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)
			self.intValue = Int(int)
		}
		
		var intValue: Int?
		init?(intValue: Int) {
			self.intValue = intValue
			self.stringValue = "\(intValue)"
		}
	}
	enum CodingKeys: String, CodingKey {
		  case idMeal,
			   strMeal,
			   strCategory,
			   strArea,
			   strInstructions,
			   strMealThumb,
			   strYoutube
	  }
	
	let id: String
	let name: String
	let category: String
	let cuisine: String
	let instructions: [String]
	let imageURL: String
	let youtubeURL: String
	let ingredients: [String]
	let measurements: [String]
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .idMeal)
		self.name = try container.decode(String.self, forKey: .strMeal)
		self.category = try container.decode(String.self, forKey: .strCategory)
		self.cuisine = try container.decode(String.self, forKey: .strArea)
		self.imageURL = try container.decode(String.self, forKey: .strMealThumb)
		self.youtubeURL = try container.decode(String.self, forKey: .strYoutube)
		self.instructions = try container.decode(String.self, forKey: .strInstructions)
			.components(separatedBy: CharacterSet.newlines)
			.filter{!$0.isEmpty}
		let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
		
		var tempIngredients: [Int: String?] = [:]
		var tempMeasures: [Int: String?] = [:]

		for key in dynamicContainer.allKeys {
			if key.stringValue.contains("Ing") {
				let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: key)
				tempIngredients[key.intValue!] = ingredient
			}
			else if key.stringValue.contains("Meas") {
				let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: key)
				tempMeasures[key.intValue!] = measure
			}
		}
		self.ingredients = tempIngredients
			.sorted{ $0.0 < $1.0}
			.compactMap(\.value)
			.filter{!$0.isEmpty}
		
		self.measurements = tempMeasures
			.sorted{ $0.0 < $1.0}
			.compactMap(\.value)
			.filter{!$0.isEmpty}
	}
}
