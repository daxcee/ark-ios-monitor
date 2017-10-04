// Copyright (c) 2016 Ark
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit


protocol SettingsSaveTableViewCellDelegate: class {
    func saveCellButtonWasTapped(_ cell: SettingsSaveTableViewCell)
}

class SettingsSaveTableViewCell: UITableViewCell {
    
    var saveButton: UIButton!

    public weak var delegate: SettingsSaveTableViewCellDelegate?
    
    init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: "username")
        
        backgroundColor = ArkPalette.backgroundColor
        selectionStyle = .none
        
        saveButton = UIButton()
        saveButton.title("Save", color: UIColor.white)
        saveButton.setBackgroundColor(ArkPalette.accentColor, forState: UIControlState())
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight:  .semibold)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8.0
        addSubview(saveButton)
        saveButton.snp.makeConstraints { (make) in
            make.width.equalTo(250.0)
            make.height.equalTo(45.0)
            make.center.equalToSuperview()
        }
    }
    
    @objc private func saveButtonTapped() {
        delegate?.saveCellButtonWasTapped(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
