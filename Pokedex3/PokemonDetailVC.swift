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
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLabel.text = "\(pokemon.pokedexID)"
        
        
        pokemon.downloadPokemonDetail
        {
            // Whatever we write here will only be called after the network call is complete!
            self.updateUI()
            
        }
    }
    
    func updateUI()
    {
        baseAttackLabel.text = pokemon.baseAttack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        
        if pokemon.nextEvolutionID == ""
        {
            evoLabel.text = "No Evolutions"
            nextEvoImg.isHidden = true
        }
        else
        {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
            let string = "Next Evolution: \(pokemon.nextEvolutionName) - Level \(pokemon.nextEvolutionLevel)"
            evoLabel.text = string
        }
        
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    

  

}
