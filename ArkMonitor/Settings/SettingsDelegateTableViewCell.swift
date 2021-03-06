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

class SettingsDelegateNotifcationTableViewCell: UITableViewCell {

    var titleLabel          : UILabel!
    var descriptionLabel    : UILabel!
    var notificationSwitch  : UISwitch!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "account")
        
        backgroundColor = ArkPalette.backgroundColor
        selectionStyle = .none
        titleLabel = UILabel()
        titleLabel.text = "Delegate Notifications"
        titleLabel.textColor = ArkPalette.highlightedTextColor
        titleLabel.font  = UIFont.systemFont(ofSize: 16.0, weight:  .semibold)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10.0)
            make.height.equalTo(20.0)
            make.left.equalTo(15.0)
            make.width.equalTo(250.0)
        }
        
        notificationSwitch             = UISwitch()
        notificationSwitch.onTintColor = ArkPalette.accentColor
        notificationSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        notificationSwitch.isOn = ArkDataManager.showDelegateNotifications
        addSubview(notificationSwitch)
        notificationSwitch.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15.0)
        }
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "If enabled, you will recieve push notifications with changes to your delegate's status"
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = ArkPalette.textColor
        descriptionLabel.font  = UIFont.systemFont(ofSize: 13.0, weight:  .light)
        descriptionLabel.adjustsFontSizeToFitWidth = true
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-5.0)
            make.left.equalTo(15.0)
            make.right.equalTo(notificationSwitch.snp.left).offset(-25.0)
        }
        
        
        
        let seperator = UIView()
        seperator.backgroundColor = ArkPalette.secondaryBackgroundColor
        addSubview(seperator)
        seperator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func switchValueChanged() {
        ArkDataManager.showDelegateNotifications =  !ArkDataManager.showDelegateNotifications
    }
}

