//
//  FilesViewController.swift
//  PDFSampler
//
//  Created by Stanly Shiyanovskiy on 14.10.2020.
//

import UIKit

public final class FilesViewController: UITableViewController {

    // MARK: - Data
    private let books = [
        "Advanced iOS Volume One",
        "Beyond Code",
        "Hacking with macOS",
        "Hacking with Swift",
        "Hacking with tvOS",
        "Hacking with watchOS",
        "Objective-C for Swift Developers",
        "Practical iOS 11",
        "Pro Swift",
        "Server-Side Swift",
        "Swift Coding Challenges"
    ]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = books[indexPath.row]
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navController = splitViewController?.viewControllers[1] as? UINavigationController else { return }
        guard let viewController = navController.viewControllers[0] as? ViewController else { return }
        
        viewController.load(books[indexPath.row])
    }
}
