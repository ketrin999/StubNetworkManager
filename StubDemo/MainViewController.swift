//
//  MainViewController.swift
//  StubDemo
//
//  Created by Kate  on 25.08.2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var catalogData: [CatalogData] = []

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")


        let networkManager = NetwokManagerProvider.getNetworkManager()
        
        networkManager.getCatalogInfo { catalogData in
            self.catalogData = catalogData

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onError: { errorString in
            let alertController = UIAlertController(title: "Ошибка!", message: errorString, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)

            alertController.addAction(okButton)

            DispatchQueue.main.async {
                self.present(alertController, animated: true)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        let data = catalogData[indexPath.row]
        cell.label.text = data.name
        return cell
    }


}

