//
//  Extensions.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static var identifier:String {
        return String(describing:self)
    }
}

extension UICollectionView {
    
    public func registerCells(_ identifier:String){
        self.register(UINib(nibName: identifier, bundle: nil),forCellWithReuseIdentifier: identifier)
    }
    
    public func setCollectionViewCells<T:UICollectionViewCell>(identifier:String,indexPath:IndexPath)->T
    {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier:identifier, for: indexPath) as? T else {
            return UICollectionViewCell() as! T
        }
        
        return cell
    }
}

