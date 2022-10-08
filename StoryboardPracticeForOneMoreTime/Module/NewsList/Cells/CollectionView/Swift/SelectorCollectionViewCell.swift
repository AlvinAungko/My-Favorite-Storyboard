//
//  SelectorCollectionViewCell.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import UIKit

protocol OntapSelectorView {
    func onTapSelector(tabedNews:String)
}

class SelectorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsLabel:UILabel!
    @IBOutlet weak var selectorView:UIView!
    @IBOutlet weak var theWholeView:UIView!
    
    private var newsObject:DummyNews? {
        didSet {
            if let data = newsObject {
                self.newsLabel.text = "\(data.name!)"
                self.playTheSelectorView(isSelected: data.isSelected!)
            }
        }
    }
    var delegate:OntapSelectorView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGesture()
        // Initialization code
    }

}

extension SelectorCollectionViewCell {
    
    private func addGesture()
    {
        self.theWholeView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTabSelector))
        self.theWholeView.addGestureRecognizer(gesture)
    }
    
    public func setTab(news:DummyNews)
    {
        self.newsObject = news
    }
    
    @objc func onTabSelector()
    {
        debugPrint("\(newsObject?.name ?? "tabed")")
        self.delegate?.onTapSelector(tabedNews:self.newsObject?.name ?? "Tabbed")
    }
    
    private func playTheSelectorView(isSelected:Bool)
    {
        switch isSelected
        {
        case true:
            self.selectorView.isHidden = false
        case false:
            self.selectorView.isHidden = true
        }
    }
   
}
