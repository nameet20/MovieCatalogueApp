//
//  AlertsHelper.swift
//  MovieCatalogue
//
//  Created by Nameet Bhave on 12/01/24.
//

import Foundation
import UIKit

func showAlert(title: ErrorTitle, message: ErrorMessage, view: UIViewController) {
    let alertController = UIAlertController(title: title.rawValue , message: message.rawValue, preferredStyle: .alert)
    let okAction = UIAlertAction(title: ErrorTitle.ok.rawValue, style: .default, handler: nil)
    alertController.addAction(okAction)
    view.present(alertController, animated: true, completion: nil)
}

func showAlert(title: String, message: String, view: UIViewController) {
    let alertController = UIAlertController(title: title , message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: ErrorTitle.ok.rawValue, style: .default, handler: nil)
    alertController.addAction(okAction)
    view.present(alertController, animated: true, completion: nil)
}

enum ErrorTitle: String {
    case ok = "OK"
    case error = "Error"
    case sorry = "Oops!"
}

enum ErrorMessage: String {
    case internet = "Please check your Internet connection."
    case noData = "Could not find that!"
}
