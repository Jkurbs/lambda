//
//  TaskCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var button = UIButton() 
    
    static var id: String {
        return String(describing: self)
    }
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = contentView.frame.height
        
        titleLabel.frame = CGRect(x: 20, y: 0, width: 100, height: height)
        titleLabel.center.y = contentView.center.y
        
        button.frame = CGRect(x: contentView.frame.width - height , y: 0, width: height, height: height)
    }
    
    func setupViews() {
        
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
    }
    
    @objc func selected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setImage(UIImage(named: "circle.fill"), for: .normal)
            task?.done = true
        } else {
            sender.setImage(UIImage(named: "circle"), for: .normal)
        }
    }
    
    func updateViews() {
        titleLabel.text = task?.title
        _ = task!.done ? button.setImage(UIImage(systemName: "circle.fill"), for: .normal) :  button.setImage(UIImage(systemName: "circle"), for: .normal)
    }
}
