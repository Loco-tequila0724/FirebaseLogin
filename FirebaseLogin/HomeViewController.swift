//
//  HomeViewController.swift
//  LoginWithFirebaseApp
//
//  Created by 日高隼人 on 2021/02/16.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class HomeViewController:UIViewController {

    var user:User? {
        didSet {
            print("user?.name: ",user?.name)
        }
    }

   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    private func handleLogout() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch (let err) {
            print("ログアウトに失敗しました：\(err)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.layer.cornerRadius = 10

        if let user = user {
            nameLabel.text = user.name + "さんようこそ"
            emailLabel.text = user.email
            let dateString = dateFormatterForCreatedAt(date: user.createdAt.dateValue())
            dateLabel.adjustsFontSizeToFitWidth = true
            dateLabel.text = "作成日: " + dateString
        }
    }

    private func dateFormatterForCreatedAt(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
}

