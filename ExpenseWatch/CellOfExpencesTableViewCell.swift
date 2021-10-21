//
//  CellOfExpencesTableViewCell.swift
//  ExpenseWatch
//
//  Created by planB on 3/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit

class CellOfExpencesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sizeCellLabel: UILabel!
    @IBOutlet weak var nameCellLabel: UILabel!
    @IBOutlet weak var dateCellLabel: UILabel!
    @IBOutlet weak var kindCellImage: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.sizeCellLabel.textColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
