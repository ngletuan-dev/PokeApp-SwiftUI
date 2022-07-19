//
//  PokemonSelected.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//
// API: https://pokeapi.co/api/v2/pokemon?limit=1154

import Foundation

class PokemonAPI {
    static let shared = PokemonAPI()
    
    func getPokemonDetail(url: String, _ completion:@escaping (PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: url, model: PokemonDetail.self) {data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonEffect(url: String, _ completion:@escaping (AbilityDetail) -> ()) {
        Bundle.main.fetchData(url: url, model: AbilityDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}

extension Bundle {
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }.resume()
    }
}
