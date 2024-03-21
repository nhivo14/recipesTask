//
//  RecipeTableViewCell.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var thumbImageView: UIImageView!
    @IBOutlet private weak var coverView: UIView!
    @IBOutlet private weak var labelStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    func setupUI() {
        thumbImageView.clipsToBounds = true
        thumbImageView.layer.cornerRadius = 10
        labelStackView.backgroundColor = UIColor.textBackgroundColor
        labelStackView.clipsToBounds = true
        labelStackView.layer.cornerRadius = 10
        nameLabel.textAlignment = .center
        headlineLabel.textAlignment = .center
    }
    
    func configData(data: Recipe) {
        nameLabel.text = data.name
        headlineLabel.text = data.headline
        let url = URL(string: data.thumb ?? "")
        thumbImageView.kf.setImage(with: url, placeholder: UIImage(named: "test"))
//        difficultyRatingView.setDifficulty(data.difficulty ?? 0)
        print(data.difficulty)
    }
}
