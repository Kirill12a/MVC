//
//  ViewController.swift
//  MVC#1
//
//  Created by Kirill Drozdov on 02.11.2021.
//

import UIKit

class CommetsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // что получить комментарии нужно
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }
    func showMainApp(){
        let mainAppViewController = UIStoryboard(name: "Comments", bundle: nil).instantiateViewController(identifier: "vk")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window{
            
            window.rootViewController = mainAppViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
    
}

extension CommetsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
}



extension CommetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("У 1 почта \(comments[0].email)")
            
           showMainApp() // сделать красиво
        case 1:
            print("У 1 почта \(comments[1].email)")
            showMainApp()
        default:
            print("deult")
        }
    }
    
}
