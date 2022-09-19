//
//  NetworkManager.swift
//  HowToCookIt(iOS)
//
//  Created by Shivangi on 2022-09-10.
//

import Foundation

enum NetworkError: Error {
	case InvalidRequest
	case DecodingError
}

class NetworkManager {
	
	func get<T: Decodable>(from url: URL, decode: (Data) -> T?) async throws -> T {
		let (data, response) = try await URLSession.shared.data(from: url)
		
		if (response as? HTTPURLResponse)?.statusCode != 200 {
			throw NetworkError.InvalidRequest
		}
		
		guard let decodedData = decode(data) else {
			throw NetworkError.DecodingError
		}
		
		return decodedData
	}
}
