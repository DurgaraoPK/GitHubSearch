//
//  ContributorDetailsViewController.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import UIKit


protocol repoDetailsDelegate {
    func openRepoDetails(objItemNew:RepositoryListModel);
}

class ContributorDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableVW: UITableView!
    @IBOutlet var ContributorImage: UIImageView!
    var objiContributor:ContributorsListModel?
    var arrItems = [RepositoryListModel]()
    var repodelagate:repoDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupUI()
        setupAPI()
        
    }
    
    func setupUI()  {
        let urlString = objiContributor?.avatarURL
        let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        let url = URL(string:urlStr as String)
        let strurl = url?.absoluteString
        self.navigationItem.title = objiContributor?.login?.capitalized
        
        ContributorImage.loadImageAsync(with: strurl, placeholder: "noimage_placeholder")
    }
    
    func setupAPI()  {
        RepositoryService.getPosts(str: (objiContributor?.reposURL)!) { (ResponseData) in
            
            self.arrItems = ResponseData
            self.tableVW.reloadData()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.arrItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:RepoDetailsTableViewCell = self.tableVW.dequeueReusableCell(withIdentifier: "RepDetailCell") as! RepoDetailsTableViewCell
        
        let objItems = arrItems[indexPath.row]
        cell.lblRepoList.text  = objItems.fullName
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objItems = arrItems[indexPath.row]
        self.repodelagate?.openRepoDetails(objItemNew:objItems)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 60
    }
    
}
