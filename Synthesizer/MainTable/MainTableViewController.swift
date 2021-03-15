//
//  MainTableViewController.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var mods: [SynthesizerMod] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private let synthesizerCellName = "synthesizerCell"
    
    let configurator: MainTableConfiguratorProtocol = MainTableConfigurator()
    var presenter: MainTablePresenterProtocol!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurator(viewController: self)
        presenter.configureView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return mods.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: synthesizerCellName, for: indexPath)
        cell.textLabel?.text = mods[indexPath.row].name
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        self.presenter.select(mod: mods[indexPath.row])
    }
}

extension MainTableViewController: MainTableViewProtocol {
    func style() {
        self.title = "Sinthesizer"
        self.clearsSelectionOnViewWillAppear = true
        self.tableView = UITableView(
            frame: tableView.frame,
            style: .grouped
        )
        self.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: synthesizerCellName
        )
    }
    
    func setSynthesizer(mods: [SynthesizerMod]) {
        self.mods = mods
    }
}
