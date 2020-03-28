//
//  ContributorViewController.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import UIKit



class ContributorViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var btnProjectLink: UIButton!
    @IBOutlet var decsriptionText: UITextView!
    @IBOutlet var CollectionVW: UICollectionView!
    @IBOutlet var imageContributor: UIImageView!
    @IBOutlet var lblName: UILabel!
    var objitemBo:Item?
    var Contributor = [ContributorsListModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupUI()
        if let urlStringctr = objitemBo?.contributorsURL{
            setupAPI(urlStringctr: urlStringctr)
        }
        
        
        
    }
    func setupAPI(urlStringctr:String){
        
        ContributorsService.getPosts(str: urlStringctr) { (Response) in
            self.Contributor = Response
            self.CollectionVW.reloadData()
            
        }
        
    }
    
    func setupUI(){
        lblName.text = objitemBo?.name.capitalized
        decsriptionText.text = objitemBo?.description
        btnProjectLink.setTitle(objitemBo?.svnURL, for: .normal)
        
        self.navigationItem.title = objitemBo?.name.capitalized
        
        let urlString = objitemBo?.owner.avatarURL
        let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        let url = URL(string:urlStr as String)
        let strurl = url?.absoluteString
        //        imageContributor.load.request(with: url!)
        
        imageContributor.loadImageAsync(with: strurl, placeholder: "noimage_placeholder")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Contributor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CollectionVWCell", for: indexPath as IndexPath) as! ContributorCollectionViewCell
        
        let objContributor = Contributor[indexPath.row]
        cell.lblName.text = objContributor.login
        
        
        let urlString = objContributor.avatarURL
        let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        let url = URL(string:urlStr as String)
        let strurl = url?.absoluteString
        cell.imageView.loadImageAsync(with: strurl, placeholder: "noimage_placeholder")
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContributorDetailsVC") as? ContributorDetailsViewController
        vc?.objiContributor = Contributor[indexPath.row]
        vc?.repodelagate = self
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 126, height: 93)
    }
    
    
    @IBAction func btnProjectLinkClicked(_ sender: UIButton) {
        
        let urlString = objitemBo?.svnURL
        let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        let url = URL(string:urlStr as String)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    
}


extension ContributorViewController:repoDetailsDelegate{
    func openRepoDetails(objItemNew: RepositoryListModel) {
        lblName.text = objItemNew.name?.capitalized
        decsriptionText.text = objItemNew.description
        btnProjectLink.setTitle(objItemNew.svnURL, for: .normal)
        
        self.navigationItem.title = objItemNew.name?.capitalized
        
        let urlString = objItemNew.owner.avatarURL
        let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        let url = URL(string:urlStr as String)
        let strurl = url?.absoluteString
        //        imageContributor.load.request(with: url!)
        
        imageContributor.loadImageAsync(with: strurl, placeholder: "noimage_placeholder")
        
        
        if let urlStringctr = objItemNew.contributorsURL{
            setupAPI(urlStringctr: urlStringctr)
        }
        
    }
}
