//
//  MyTableViewCell.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import UIKit

final class MyTableViewCell: UITableViewCell {

    let mylabel: UILabel = UILabel()
    let title: UILabel = UILabel()
    var desciription: UILabel = UILabel()
    lazy var rightImage: UIImageView = {
            let imgView = UIImageView()
            imgView.contentMode = .scaleAspectFit
            imgView.translatesAutoresizingMaskIntoConstraints = false
            return imgView
        }()
    enum Identifier : String {
        case custom = "cell"
    }
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        confugire()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupCell(image: String) {
        rightImage.image = UIImage(named: image)
    }
    func savemodel(model: Btc) {
            self.title.text = "Satış =\(model.satis ?? "00000")"
            self.mylabel.text = "Alis = "+(model.alis ?? "0000")
    }
    
}
