//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by H.Namikawa on 2023/05/09.
//

import UIKit

protocol AddRegistrationTableViewControllerDelegate {
  func addRegistration(registration: Registration)
  func editRegistration(registration: Registration)
  func dismissAddRegistration()
}

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
  // personal info
  let firstNameCell = PersonalInfoTableViewCell()
  let lastNameCell = PersonalInfoTableViewCell()
  let emailCell = PersonalInfoTableViewCell()
  // checkin&out date
  let checkInDateLblCell = DateLabelTableViewCell()
  let checkInDatePickerCell = DatePickerTableViewCell()
  let checkOutDateLblCell = DateLabelTableViewCell()
  let checkOutDatePickerCell = DatePickerTableViewCell()
  // number of guests
  let numOfAdultsCell = NumberOfGuestsTableViewCell()
  let numOfChildrenCell = NumberOfGuestsTableViewCell()
  // wifi
  let wifiCell = WifiTableViewCell()
  // room type
  let roomTypeCell = RoomTypeTableViewCell()
  
  var roomType: RoomType?
  var selectedRegistration: Registration?
  
  var registration: Registration? {
    guard let roomType = roomType else {return nil}
    
    let firstName = firstNameCell.textField.text ?? ""
    let lastName = lastNameCell.textField.text ?? ""
    let email = emailCell.textField.text ?? ""
    let checkInDate = checkInDatePickerCell.datePicker.date
    let checkOutDate = checkOutDatePickerCell.datePicker.date
    let numberOfAdults = Int(numOfAdultsCell.numOfGuestsStepper.value)
    let numberOfChildren = Int(numOfChildrenCell.numOfGuestsStepper.value)
    let hasWifi = wifiCell.wifiSwitch.isOn
    
    return Registration(firstName: firstName,
                        lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    
  }
  
  var delegate: AddRegistrationTableViewControllerDelegate?
  
  let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
  let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
  let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
  let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
  let roomTypeCellIndexPath = IndexPath(row: 0, section: 4)
  
  var isCheckInDatePickerVisible: Bool = false {
    didSet{
      checkInDatePickerCell.datePicker.isHidden = !isCheckInDatePickerVisible
    }
  }
  var isCheckOutDatePickerVisible: Bool = false {
    didSet{
      checkOutDatePickerCell.datePicker.isHidden = !isCheckOutDatePickerVisible
    }
  }
  
  func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
    
    self.roomType = roomType
    updateRoomType()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set navigation items
    navigationItem.title = "Add Registration"
    let doneBtn =
    UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(doneBarButtonTapped))
    let cancelBtn =
    UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(cancelButtonTapped))
    navigationItem.rightBarButtonItem = doneBtn
    navigationItem.leftBarButtonItem = cancelBtn
    
    // dynamic row height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44.0
    
    // set personal info row
    firstNameCell.textField.placeholder = "First Name"
    lastNameCell.textField.placeholder = "Last Name"
    emailCell.textField.placeholder = "Email"
    // check-in&-out date
    checkInDateLblCell.dateTitleLabel.text = "Check-in Date"
    checkInDateLblCell.dateLabel.text = "Check-in Date"
    checkOutDateLblCell.dateTitleLabel.text = "Check-out Date"
    checkOutDateLblCell.dateLabel.text = "Check-out Date"
    // number of guests
    numOfAdultsCell.guestLabel.text = "Adults"
    numOfChildrenCell.guestLabel.text = "Children"
    
    let midNightToday = Calendar.current.startOfDay(for: Date())
    checkInDatePickerCell.datePicker.minimumDate = midNightToday
    checkInDatePickerCell.datePicker.date = midNightToday
    updateRegistration()

    updateDateViews()
    updateNumberOfGuests()
    updateRoomType()
    
    // Actions
    checkInDatePickerCell.datePicker
      .addTarget(self, action:#selector(datePickerValueChanged) , for: .valueChanged)
    checkOutDatePickerCell.datePicker
      .addTarget(self, action:#selector(datePickerValueChanged) , for: .valueChanged)
    numOfAdultsCell.numOfGuestsStepper
      .addTarget(self, action:#selector(stepperValueChanged) , for: .valueChanged)
    numOfChildrenCell.numOfGuestsStepper
      .addTarget(self, action:#selector(stepperValueChanged) , for: .valueChanged)
    wifiCell.wifiSwitch
      .addTarget(self, action:#selector(wifiSwitchChanged) , for: .valueChanged)
    
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath {
    case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
      return 0
    case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
      return 0
    default:
      return UITableView.automaticDimension
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numOfRows = 0
    switch section {
    case 0:
      numOfRows = 3
    case 1:
      numOfRows = 4
    case 2:
      numOfRows = 2
    case 3:
      numOfRows = 1
    case 4:
      numOfRows = 1
    default:
      break
    }
    return numOfRows
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath {
    case [0, 0]:
      return firstNameCell
    case [0, 1]:
      return lastNameCell
    case [0, 2]:
      return emailCell
    case [1, 0]:
      return checkInDateLblCell
    case [1, 1]:
      return checkInDatePickerCell
    case [1, 2]:
      return checkOutDateLblCell
    case [1, 3]:
      return checkOutDatePickerCell
    case [2, 0]:
      return numOfAdultsCell
    case [2, 1]:
      return numOfChildrenCell
    case [3, 0]:
      return wifiCell
    case [4, 0]:
      return roomTypeCell
    default:
      fatalError("Invalid number of cells")
    }
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath{
    case checkInDatePickerCellIndexPath:
      return 200
    case checkOutDatePickerCellIndexPath:
      return 200
    default:
      return UITableView.automaticDimension
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false {
      isCheckInDatePickerVisible.toggle()
    } else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false {
      isCheckOutDatePickerVisible.toggle()
    } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath {
      isCheckInDatePickerVisible.toggle()
      isCheckOutDatePickerVisible.toggle()
    } else if indexPath == roomTypeCellIndexPath {
      moveToSelectRoomType()
    } else {
      return
    }
    
    tableView.beginUpdates()
    tableView.endUpdates()
  }
  
  @objc private func doneBarButtonTapped(_ sender: UIBarButtonItem) {
    if let delegate = self.delegate, let registration = registration {
      if selectedRegistration != nil  {
        delegate.editRegistration(registration: registration)
      } else {
        delegate.addRegistration(registration: registration)
      }
      dismiss(animated: true)
      delegate.dismissAddRegistration()
    }
  }
  
  
  @objc private func cancelButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    delegate?.dismissAddRegistration()
  }
  
  @objc private func personalInfoChanged(_ sender: UITextField) {
  }
  
  @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
    updateDateViews()
  }
  
  @objc private func stepperValueChanged(_ sender: Any) {
    updateNumberOfGuests()
    
  }
  
  
  @objc private func wifiSwitchChanged(_ sender: Any) {
    
  }
  
  func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
    
    let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
    selectRoomTypeController?.delegate = self
    selectRoomTypeController?.roomType = roomType
    
    return selectRoomTypeController
  }
  
  private func moveToSelectRoomType(){
    let selectRoomTypeTVC = SelectRoomTypeTableViewController()
    selectRoomTypeTVC.delegate = self
    selectRoomTypeTVC.roomType = self.roomType
    navigationController?.pushViewController(selectRoomTypeTVC, animated: true)
  }
  
  func updateRegistration() {
    
    if let registration = selectedRegistration {
      firstNameCell.textField.text = registration.firstName
      lastNameCell.textField.text = registration.lastName
      emailCell.textField.text = registration.emailAddress
      checkInDatePickerCell.datePicker.date = registration.checkInDate
      checkOutDatePickerCell.datePicker.date = registration.checkOutDate
      numOfAdultsCell.numOfGuestsStepper.value = Double(registration.numberOfAdults)
      numOfChildrenCell.numOfGuestsStepper.value = Double(registration.numberOfChildren)
      wifiCell.wifiSwitch.isOn = registration.wifi
      roomType = registration.roomType
    }
  }
  
  func updateDateViews() {
    
    checkOutDatePickerCell.datePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePickerCell.datePicker.date)
    
    checkInDateLblCell.dateLabel.text =
    checkInDatePickerCell.datePicker.date.formatted(date: .abbreviated, time: .omitted)
    checkOutDateLblCell.dateLabel.text =
    checkOutDatePickerCell.datePicker.date.formatted(date: .abbreviated, time: .omitted)
  }
  
  func updateNumberOfGuests() {
    numOfAdultsCell.numOfGuestsLabel.text = "\(Int(numOfAdultsCell.numOfGuestsStepper.value))"
    numOfChildrenCell.numOfGuestsLabel.text = "\(Int(numOfChildrenCell.numOfGuestsStepper.value))"
  }
  
  func updateRoomType() {
    if let roomType = roomType {
      roomTypeCell.roomTypeLbl.text = roomType.name
    } else {
      roomTypeCell.roomTypeLbl.text = "Not Set"
    }
  }
}
