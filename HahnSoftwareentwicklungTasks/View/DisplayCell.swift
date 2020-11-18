//
//  DisplayCell.swift
//  Task
//
//  Created by LokeshReddy on 09/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

class DisplayCell: UITableViewCell {
    @IBOutlet weak var displayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
