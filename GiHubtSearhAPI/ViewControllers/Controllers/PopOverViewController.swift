//
//  PopOverViewController.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import UIKit

protocol popOverMethods {
    func reloadData(strFilter:String)
}

class PopOverViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableVW: UITableView!
    var popDelegate:popOverMethods?
    let array = ["Watchers Count","Stargazers Count","Forks Count","Openissues Count"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:RepoDetailsTableViewCell = self.tableVW.dequeueReusableCell(withIdentifier: "FilterCell") as! RepoDetailsTableViewCell
        
        cell.lblRepoList.text  = array[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        popDelegate?.reloadData(strFilter: array[indexPath.row])
        self.dismiss(animated: false, completion: nil)
        
    }

}
