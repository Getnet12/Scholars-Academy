//
//  StudentCell.swift
//  Scholars Academy
//
//  Created by Dinaol Tadesse on 22/02/2022.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var studentId: UILabel!
    @IBOutlet weak var cicoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
