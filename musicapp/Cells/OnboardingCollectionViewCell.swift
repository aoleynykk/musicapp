//
//  OnboardingCollectionViewCell.swift
//  musicapp
//
//  Created by Олександр Олійник on 19.07.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureOnboardingSlide(data: OnboardingSlideModel){
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
        self.slideImageView.image = data.image
    }
}
