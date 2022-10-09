//
//  RecentNewsCollectionViewCell.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import UIKit

class RecentNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var theWholeBackgroundView:UIView!
    
    public var onTabRecentNews:()->Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundTheCorners()
        addGesture()
        // Initialization code
    }
    
}

extension RecentNewsCollectionViewCell
{
    private func roundTheCorners()
    {
        self.theWholeBackgroundView.clipsToBounds = true
        self.theWholeBackgroundView.layer.cornerRadius = 15
    }
    
    private func addGesture()
    {
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(onTabRecentNewsCell))
        self.theWholeBackgroundView.isUserInteractionEnabled = true
        self.theWholeBackgroundView.addGestureRecognizer(tabGesture)
    }
    
    @objc func onTabRecentNewsCell()
    {
        self.onTabRecentNews()
    }
}
