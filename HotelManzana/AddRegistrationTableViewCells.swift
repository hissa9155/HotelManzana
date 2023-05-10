//
//  AddRegistrationTableViewCell.swift
//  HotelManzana
//
//  Created by H.Namikawa on 2023/05/09.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell {

  let textField: UITextField = {
    let text = UITextField()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.borderStyle = .roundedRect
    return text
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(textField)
    textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class DateLabelTableViewCell: UITableViewCell {

  let dateTitleLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.text = "sample"
    return lbl
  }()
  let dateLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.setContentHuggingPriority(.required, for: .horizontal)
    return lbl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let sv = UIStackView(arrangedSubviews: [dateTitleLabel, dateLabel])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .horizontal
    sv.alignment = .fill
    sv.distribution = .fill
    
    contentView.addSubview(sv)
    sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    //sv.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class DatePickerTableViewCell: UITableViewCell {
  
  let datePicker: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.preferredDatePickerStyle = .wheels
    return datePicker
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(datePicker)
    datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
    datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    datePicker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class NumberOfGuestsTableViewCell: UITableViewCell {
  
  let guestLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  let numOfGuestsLabel: UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.setContentHuggingPriority(.required, for: .horizontal)
    return lbl
  }()
  let numOfGuestsStepper: UIStepper = {
    let stepper = UIStepper()
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.setContentHuggingPriority(.required, for: .horizontal)
    return stepper
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let sv = UIStackView(arrangedSubviews: [guestLabel, numOfGuestsLabel, numOfGuestsStepper])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .horizontal
    sv.spacing = 5
    sv.alignment = .fill
    sv.distribution = .fill
    
    contentView.addSubview(sv)
    sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    //sv.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class WifiTableViewCell: UITableViewCell {
  
  let wifiLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Wi-Fi"
    return label
  }()
  let wifiCostLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.setContentHuggingPriority(.required, for: .horizontal)
    label.text = "$10 per days"
    return label
  }()
  let wifiSwitch: UISwitch = {
    let uiSwitch = UISwitch()
    uiSwitch.translatesAutoresizingMaskIntoConstraints = false
    uiSwitch.setContentHuggingPriority(.required, for: .horizontal)
    return uiSwitch
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let sv = UIStackView(arrangedSubviews: [wifiLabel, wifiCostLabel, wifiSwitch])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .horizontal
    sv.spacing = 5
    sv.alignment = .fill
    sv.distribution = .fill
    
    contentView.addSubview(sv)
    sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    //sv.heightAnchor.constraint(equalToConstant: 44).isActive = true
    
    wifiSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class RoomTypeTableViewCell: UITableViewCell {
  
  let titleLbl:UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    lbl.text = "Room Type"
    return lbl
  }()
  let roomTypeLbl:UILabel = {
    let lbl = UILabel()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    accessoryType = .disclosureIndicator
    
    let sv = UIStackView(arrangedSubviews: [titleLbl, roomTypeLbl])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .horizontal
    sv.spacing = 5
    sv.alignment = .fill
    sv.distribution = .fill
    
    contentView.addSubview(sv)
    sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    sv.heightAnchor.constraint(equalToConstant: 44).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

