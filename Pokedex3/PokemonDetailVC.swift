//
//  PokemonDetailVC.swift
//  Pokedex3
//
//  Created by Ken Krippeler on 13.07.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController
{
    var pokemon: Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized

    }

  

}
