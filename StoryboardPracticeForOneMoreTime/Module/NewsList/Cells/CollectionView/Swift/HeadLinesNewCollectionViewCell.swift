//
//  HeadLinesNewCollectionViewCell.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import UIKit

class HeadLinesNewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsImageView:UIImageView!
    @IBOutlet weak var theWholeBackgroundView:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundTheCorners()
        // Initialization code
    }
    
    private func roundTheCorners()
    {
        self.theWholeBackgroundView.clipsToBounds = true
        self.theWholeBackgroundView.layer.cornerRadius = 15
    }
}
