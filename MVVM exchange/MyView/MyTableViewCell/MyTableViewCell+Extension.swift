//
//  MyTableViewCell+Extension.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//


import UIKit

extension MyTableViewCell {
    func confugire() {
        mylabel.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        desciription.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mylabel)
        addSubview(rightImage)
        addSubview(title)
        addSubview(desciription)
        mylabel.font = UIFont.systemFont(ofSize: 20)
        title.font = UIFont.systemFont(ofSize: 20)
        desciription.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            rightImage.topAnchor.constraint(equalTo: topAnchor),
            rightImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightImage.leftAnchor.constraint(equalTo: leftAnchor),
            rightImage.widthAnchor.constraint(equalTo: rightImage.heightAnchor),
            
            title.topAnchor.constraint(equalTo: desciription.topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.rightAnchor.constraint(equalTo: rightAnchor),
            title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            desciription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            desciription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            desciription.rightAnchor.constraint(equalTo: rightAnchor),
            desciription.topAnchor.constraint(equalTo: self.topAnchor),
            
            mylabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            mylabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            mylabel.rightAnchor.constraint(equalTo: rightAnchor),
            mylabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            ])
    }

}
