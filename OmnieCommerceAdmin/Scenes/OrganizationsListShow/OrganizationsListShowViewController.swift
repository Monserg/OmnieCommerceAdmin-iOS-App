//
//  OrganizationsListShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol OrganizationsListShowViewControllerInput {
    func displaySomething(viewModel: OrganizationsListShow.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationsListShowViewControllerOutput {
    func doSomething(request: OrganizationsListShow.Something.Request)
}

class OrganizationsListShowViewController: BaseViewController, OrganizationsListShowViewControllerInput {
    // MARK: - Properties
    var interactor: OrganizationsListShowViewControllerOutput!
    var router: OrganizationsListShowRouter!
    

    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OrganizationsListShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // Add menu bar button
        showNavigationBar(withTitle: "My organizations")
        self.title = titleText!
        
//        (navigationController as! BaseNavigationController).addLeftMenuBarButton(withImage: .Menu)

//        let request = OrganizationsListShow.Something.Request()
//        interactor.doSomething(request: request)
        
    }
    
    
    // MARK: - Actions
    @IBAction func handlerHereButtonTap(_ sender: CustomButton) {
    }
    
    
    
    // Display logic
    func displaySomething(viewModel: OrganizationsListShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}


// MARK: - UITableViewDataSource
extension OrganizationsListShowViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrganizationCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) //as UITableViewCell
        
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as! UITableViewCell?
        }
        
        return cell!
    }
}


// MARK: - UITableViewDelegate
extension OrganizationsListShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

