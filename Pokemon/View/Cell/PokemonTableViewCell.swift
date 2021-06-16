//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Abdul Rahim on 11/06/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    var pokemonImage = UIImageView()
    var pokemonName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pokemonImage)
        addSubview(pokemonName)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }
    
    func set() {
        pokemonImage.image = UIImage(named: "1")
        pokemonName.text = "Balbasur"
    }
    
    func configureView() {
        pokemonImage.layer.cornerRadius = 10
        pokemonImage.clipsToBounds = true
        pokemonName.numberOfLines = 0
        pokemonName.adjustsFontSizeToFitWidth = true
        
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        pokemonImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        pokemonImage.widthAnchor.constraint(equalTo: pokemonImage.heightAnchor, multiplier: 16/9).isActive = true
        
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        pokemonName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokemonName.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 20).isActive = true
        pokemonName.heightAnchor.constraint(equalToConstant: 80).isActive = true
        pokemonName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
