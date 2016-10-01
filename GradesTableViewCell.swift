//
//  GradesTableViewCell.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/21/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import UIKit

//Customizing the cell in the table view of detail view.
class GradesTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfessorName: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var C: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var F: UILabel!
    @IBOutlet weak var W: UILabel!
    @IBOutlet weak var Total: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
