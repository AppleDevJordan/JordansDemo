//
//  APIService 2.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//


import Foundation

class APIService {
    static let shared = APIService()
    private let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"

    func fetchCountries(completion: @escaping ([Country]) -> Void) {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async { completion([]) }
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network error:", error)
                DispatchQueue.main.async { completion([]) }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async { completion([]) }
                return
            }

            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async { completion(countries) }
            } catch {
                print("Decoding error:", error)
                DispatchQueue.main.async { completion([]) }
            }
        }.resume()
    }
}
