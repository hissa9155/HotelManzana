//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by H.Namikawa on 2023/05/09.
//

import UIKit
class RegistrationTableViewController: UITableViewController, AddRegistrationTableViewControllerDelegate {
  
  var registrations: [Registration] = []
  var selectedIndexPath: IndexPath?
  
  private let cellIdentifier = "RegistrationCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(RegistrationTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    navigationItem.title = "Registrations"
    //navigationItem.largeTitleDisplayMode = .always
    //tableView.largeContentTitle = "Registrations"
    
    let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addButtonTapped))
    navigationItem.rightBarButtonItem = addBtn
  }
  
  func addRegistration(registration: Registration) {
    registrations.append(registration)
    tableView.insertRows(at: [IndexPath(row: registrations.count - 1, section: 0)], with: .automatic)
  }
  
  func editRegistration(registration: Registration) {
    let indexPath = tableView.indexPathForSelectedRow!
    registrations.remove(at: indexPath.row)
    registrations.insert(registration, at: indexPath.row)
    tableView.deselectRow(at: indexPath, animated: true)
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
  func dismissAddRegistration() {
    selectedIndexPath = nil
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return registrations.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    let registration = registrations[indexPath.row]
    
    var content = cell.defaultContentConfiguration()
    content.text = registration.firstName + " " + registration.lastName
    content.secondaryText =
    (registration.checkInDate..<registration.checkOutDate).formatted(date:.numeric, time:.omitted)
    + " : " + registration.roomType.name
    cell.contentConfiguration = content
                                                    
    return cell
  }
  
  // when tap the add button
  @objc private func addButtonTapped() {
    moveToAddRegistration()
  }
  
  // when tap each row
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedIndexPath = indexPath
    moveToAddRegistration()
    //performSegue(withIdentifier: "selectRegistration", sender: nil)
  }
  
  private func moveToAddRegistration() {
    let addRegistrationTVC = AddRegistrationTableViewController(style: .grouped)
    addRegistrationTVC.delegate = self
    if let indexPath = selectedIndexPath {
      addRegistrationTVC.selectedRegistration = registrations[indexPath.row]
    }
    let addRegistrationNC = UINavigationController(rootViewController: addRegistrationTVC)
    present(addRegistrationNC, animated: true)
  }
  
}
