//
//  RoundedButton.swift
//  View Only
//
//  Created by Nico Boentoro on 7/31/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        
        didSet{
            self.layer.cornerRadius = cornerRadius
            
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        
        didSet{
            self.layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
        
    }


}
