//
//  ViewController.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    @IBOutlet weak var mActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mUserListTablewView: UITableView!
    
    fileprivate lazy var userListPresenter : UserListPresenter = {
        return UserListPresenter(delegate: self)
    }()
    
    private var mUserList:[User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///TableView
        mUserListTablewView.register(UINib.init(nibName: UserListTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: UserListTableViewCell.identifier)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ///Call All User
        userListPresenter.getUserList()
    }
}


// MARK: UserListView Methods
extension UserListVC: UserListView {
    func loadingUserList() {
        mActivityIndicator.startAnimating()
    }
    
    func setUserList(_ users: [User]) {
        mUserList = users
        mUserListTablewView.reloadData()
        mUserListTablewView.isHidden = false
        mActivityIndicator.stopAnimating()
        
    }
    
    func setEmptyUserList() {
        
    }
    
    func onError(_ error: String) {
        
    }
}


// MARK: TableView Methods
extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserListTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as! UserListTableViewCell
        cell.configure(user: mUserList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = mUserList[indexPath.row]
        let userDetailVC:UserDetailVC = UIStoryboard(name: UserDetailVC.storyboardName, bundle: nil).instantiateViewController(withIdentifier: UserDetailVC.identifier) as! UserDetailVC
        userDetailVC.mUser = selectedUser
        self.present(userDetailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
}
