//
//  ContactTableViewController.swift
//  Directory
//
//  Created by oktay on 26.02.2023.
//

import UIKit

class ContactTableViewController: UITableViewController {

    var contacts : [[ContactModel]] = ContactSource.sectionedContacs

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactsModelCell else { fatalError("Contact error")}
        
        let item = contacts[indexPath.section][indexPath.row]
        
        customCell.lblName.text =  "\(item.firstName) \(item.lastName)"
        customCell.lblCity.text = item.city
        customCell.imgProfile.image = item.image
        customCell.imgFavorite.isHidden = !item.favorite
        return customCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goContactDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ContactSource.uniqueFirstLetters[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ContactSource.uniqueFirstLetters
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedContact = contacts[indexPath.section][indexPath.row]
            let destination : DetailsViewController = segue.destination as! DetailsViewController
            destination.contact = selectedContact
            destination.delegate = self
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension ContactTableViewController : ContactDetailControllerDelegate {
    func markAsFavoriteContact(contact: ContactModel) {
        
        var sectionIndex : Int? = nil
        var contactIndex : Int? = nil
        
        
        for (index, contacts) in contacts.enumerated() {
            
            if let indexOfContacts = contacts.index(of: contact) {
                
                sectionIndex = index
                contactIndex = indexOfContacts
                break
            }
        }
        
        
        if let sectionIndex = sectionIndex , let contactIndex = contactIndex {
            contacts[sectionIndex][contactIndex].favorite = contact.favorite
            tableView.reloadData()
        }
    }
}

extension ContactModel: Equatable {
    
    static func == (lContact : ContactModel , rContact : ContactModel) -> Bool {
        return lContact.firstName == rContact.firstName && lContact.lastName == rContact.lastName && lContact.street == rContact.street && lContact.city == rContact.city && lContact.state == rContact.state && lContact.zip == rContact.zip && lContact.phone == rContact.phone && lContact.email == rContact.email
    }
    
    
}



extension ContactModel {
    
    var firstLetter : String {
        return String(firstName.prefix(1))
    }
}

extension ContactSource {
    static var uniqueFirstLetters : [String] {
        
        let firstLetters = contacts.map { $0.firstLetter }
        let uniqueLetters = Set(firstLetters)
        
        return Array(uniqueLetters).sorted()
    }
    
    
    static var sectionedContacs : [[ContactModel]] {
        
        return uniqueFirstLetters.map{ firstLetter in
            let filteredContacts = contacts.filter { $0.firstLetter ==  firstLetter }
            return filteredContacts.sorted(by: { $0.firstName < $1.firstName  })
             }
        
    }
    
}



