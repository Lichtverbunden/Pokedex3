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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    

  

}
