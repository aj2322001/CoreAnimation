//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Archit Joshi on 07/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let coreAnimationTypes: [CoreAnimationType] = [.move, .scale, .rotate, .shake, .circling]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setTableView()
        
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: AnimationTypeTableViewCell().identifier, bundle: nil), forCellReuseIdentifier: AnimationTypeTableViewCell().identifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreAnimationTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnimationTypeTableViewCell().identifier, for: indexPath) as? AnimationTypeTableViewCell else { return UITableViewCell() }
        cell.configure(with: coreAnimationTypes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigateToAnimationsScreen(animationType: self.coreAnimationTypes[indexPath.row])
    }
    
    private func navigateToAnimationsScreen(animationType: CoreAnimationType) {
        let animationsViewController = AnimationsViewController()
        animationsViewController.configure(with: animationType)
        self.navigationController?.pushViewController(animationsViewController, animated: true)
    }
}

enum CoreAnimationType: String {
    case move = "Move"
    case scale = "Scale"
    case rotate = "Rotate"
    case shake = "Shake"
    case circling = "Circling"
}
