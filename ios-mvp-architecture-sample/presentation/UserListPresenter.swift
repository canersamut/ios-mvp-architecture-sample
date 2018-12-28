//
//  UserListPresenter.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import Foundation

protocol UserListView: NSObjectProtocol {
    func loadingUserList()
    func setUserList(_ users:[User])
    func setEmptyUserList()
    func onError(_ error:String)
}

class UserListPresenter {
    
    private var apiManager:APIManager = APIManager.instance
    weak private var delegate : UserListView?
    
    init(delegate:UserListView) {
        self.delegate = delegate
    }
    
    /// Get All User List
    func getUserList() {
        delegate?.loadingUserList()
        apiManager.callUser(onSuccess: {(users:[User]) in
            if users.count == 0{
                self.delegate?.setEmptyUserList()
            }else {
                self.delegate?.setUserList(users)
            }
        }, onFailure: {(error:String) in
            self.delegate?.onError(error)
        })
    }
    
}
