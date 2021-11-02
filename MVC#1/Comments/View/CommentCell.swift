//
//  CommentCell.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    //MARK: Функция которая заполнит ячейку
    /// Мы хотим заполнить наш View при помощи модельки Comment
    /// - Parameter comment: Модель данных
    func configure(with comment: Comment){
        self.label.text = comment.name
        self.textView.text = comment.body
    }
}
