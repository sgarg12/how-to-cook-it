//
//  BackButton.swift
//  HowToCookIt
//
//  Created by Shivangi on 2022-09-23.
//

import SwiftUI

struct BackButton: View {
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		HStack{
			Button{ dismiss() } label: {
				Image(systemName: "chevron.backward")
					.font(.title3)
					.foregroundColor(.blackGreen)
					.padding()
					.background(.thinMaterial, in: Circle())
			}
			Spacer()
		}
		.padding(.top, 25)
		.padding(.leading, 20)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
