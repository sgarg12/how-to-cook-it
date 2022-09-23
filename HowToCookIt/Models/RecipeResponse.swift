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
}

extension Recipe {
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
	init(){
		id = ""
		name = ""
		category = ""
		cuisine = ""
		instructions = []
		imageURL = ""
		youtubeURL = ""
		ingredients = []
		measurements = []
	}
}

extension Recipe {
	static var mockData: Recipe = Recipe(
		id: "52772",
		name: "Teriyaki Chicken Casserole",
		category: "Chicken",
		cuisine: "Japanese",
		instructions: [
			"Preheat oven to 350\u{00b0} F.Spray a 9x13-inch baking pan with non-stick spray.",
			"Combine soy sauce, \u{00bd} cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.",
			"Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.",
			"Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.",
			"Meanwhile, steam or cook the vegetables according to package directions.",
			"Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving.",
			"Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes.",
			"Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!"
		],
		imageURL: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
		youtubeURL: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
		ingredients: [
			"soy sauce",
			"water",
			"brown sugar",
			"ground ginger",
			"minced garlic",
			"cornstarch",
			"chicken breasts",
			"stir-fry vegetables",
			"brown rice"
		],
		measurements: [
			"3/4 cup",
			"1/2 cup",
			"1/4 cup",
			"1/2 teaspoon",
			"1/2 teaspoon",
			"4 Tablespoons",
			"2",
			"1 (12 oz.)",
			"3 cups"
		]
	)
}
