//
//  InstructionsView.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-23.
//

import SwiftUI

struct InstructionsView: View {
	var steps: [String]
    var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .lastTextBaseline) {
				Text("Steps")
					.font(.title3)
					.foregroundColor(.blackGreen)
					.padding(.top, 30)
				Spacer()
				Text("\(steps.count) steps")
					.font(.callout)
					.foregroundColor(.tropeGray)
			}
			
			ForEach(steps, id: \.self) { step in
				Text(step)
					.foregroundColor(.blackGreen)
					.padding(.vertical)
			}
		}
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
		InstructionsView(steps: Recipe.mockData.instructions)
    }
}
