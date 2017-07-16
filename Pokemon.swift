//
//  Pokemon.swift
//  Pokedex3
//
//  Created by Ken Krippeler on 12.07.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon
{
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionID: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonURL: String!
    
    var name: String { return _name }
    var pokedexID: Int { return _pokedexID }
    
    var nextEvolutionLevel: String
    {
        if _nextEvolutionLevel == nil
        {
            _nextEvolutionLevel = ""
        }
        
        return _nextEvolutionLevel
    }

    
    var nextEvolutionID: String
    {
        if _nextEvolutionID == nil
        {
            _nextEvolutionID = ""
        }
        
        return _nextEvolutionID
    }

    
    var nextEvolutionName: String
    {
        if _nextEvolutionName == nil
        {
            _nextEvolutionName = ""
        }
        
        return _nextEvolutionName
    }

    
    var nextEvolutionText: String
    {
        if _nextEvolutionText == nil
        {
            _nextEvolutionText = ""
        }
        
        return _nextEvolutionText
    }
    
    var baseAttack: String
    {
        if _baseAttack == nil
        {
            _baseAttack = ""
        }
        
        return _baseAttack
    }
    
    var weight: String
    {
        if _weight == nil
        {
            _weight = ""
        }
        
        return _weight
    }
    
    var height: String
    {
        if _height == nil
        {
            _height = ""
        }
        
        return _height
    }
    var defense: String
    {
        if _defense == nil
        {
            _defense = ""
        }
        
        return _defense
    }
    var type: String
    {
        if _type == nil
        {
            _type = ""
        }
        
        return _type
    }
    var description: String
    {
        if _description == nil
        {
            _description = ""
        }
        
        return _description
    }

    
    
    
    
    
    init(name: String, pokedexID: Int)
    {
        self._name = name
        self._pokedexID = pokedexID
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete)
    {
        Alamofire.request(_pokemonURL).responseJSON
        { (response) in
            if let dict = response.result.value as? Dictionary<String, Any>
            {
                if let weight = dict["weight"] as? String
                {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String
                {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int
                {
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int
                {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0
                {
                    if let name = types[0]["name"]
                    {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1
                    {
                        for x in 1..<types.count
                        {
                            if let name = types[x]["name"]
                            {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    
                }
                else
                {
                    self._type = ""
                }
                
                if let descriptionArray = dict["descriptions"] as? [Dictionary<String, String>] , descriptionArray.count > 0
                {
                    if let url = descriptionArray[0]["resource_uri"]
                    {
                        let descURL = "\(URL_BASE)\(url)"
                        
                        Alamofire.request(descURL).responseJSON(completionHandler:
                            { (response) in
                                if let descDict = response.result.value as? Dictionary<String, Any>
                                {
                                    if let description = descDict["description"] as? String
                                    {
                                        let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                        
                                        self._description = newDescription.capitalized
                                    }
                                }
                                completed()
                        })
                    }
                }
                else
                {
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, Any>] , evolutions.count > 0
                {
                    if let nextEvo = evolutions[0]["to"] as? String
                    {
                        if nextEvo.range(of: "mega") == nil
                        {
                            self._nextEvolutionName = nextEvo
                            
                            if let uri = evolutions[0]["resource_uri"] as? String
                            {
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID = newString.replacingOccurrences(of: "/", with: "")
                                
                                self._nextEvolutionID = nextEvoID
                                
                                if let levelExist = evolutions[0]["level"]
                                {
                                    if let level = levelExist as? Int
                                    {
                                        self._nextEvolutionLevel = "\(level)"
                                    }
                                }
                                else
                                {
                                    self._nextEvolutionLevel = ""
                                }
                            }
                        }
                    }
                }
                
            }
            
            completed()
        }
    }
}
