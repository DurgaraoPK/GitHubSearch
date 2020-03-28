//
//  ViewController.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import UIKit
//import ImageLoader

class ViewController: UIViewController,UISearchBarDelegate,UIPopoverControllerDelegate,UIPopoverPresentationControllerDelegate,popOverMethods,UITextFieldDelegate
{

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableVW: UITableView!
//    var objBaseRepoModel:BaseRepoModel?
    @IBOutlet weak var lblNodata: UILabel!
    var arrItems = [Item]()
    
     var searchTimer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.

        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(textField:)), name: UITextField.textDidChangeNotification, object: nil)
   
    }
    @objc func textFieldDidChange(textField: UITextField) {
        if self.searchTimer != nil {
            self.searchTimer?.invalidate()
            self.searchTimer = nil
        }
    
        self.searchTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(searchKeyCalled(timer:)), userInfo: nil, repeats: false)
    }
    @objc func searchKeyCalled(timer: Timer) {
        
        if let searchText = searchBar.text{
            
            let scene = UIApplication.shared.connectedScenes.first
            let objScenDelegate  = scene?.delegate as? SceneDelegate
            objScenDelegate?.removeLoader()
            objScenDelegate?.showLoader()
            
            
            PostNetworking.getPosts(str: searchText) { (response) in
                objScenDelegate?.removeLoader()
                
                if response.items.count >= 10{
                    let range = 10...response.items.count-1
                    self.arrItems = response.items
                    self.arrItems.removeSubrange(range)
                }else{
                    self.arrItems = response.items
                    
                }
                
                self.arrItems = self.arrItems.sorted(by: { (obj1, obj2) -> Bool in
                    return obj1.watchersCount > obj2.watchersCount
                })
                
                self.tableVW.reloadData()
            }
        }
        
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
         print("Dismissed")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*.....Deligate methods for SearchBar.......................*/
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        print(searchText)
//        PostNetworking.getPosts(str: searchText) { (response) in
//
//            if response.items.count >= 10{
//                let range = 10...response.items.count-1
//                self.arrItems = response.items
//                self.arrItems.removeSubrange(range)
//            }else{
//                self.arrItems = response.items
//
//            }
//
//            self.arrItems = self.arrItems.sorted(by: { (obj1, obj2) -> Bool in
//                return obj1.watchersCount > obj2.watchersCount
//            })
//
//            self.tableVW.reloadData()
//        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("Dismissed")
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.none
    }
    @IBAction func btnFilterClicked(_ sender: UIButton) {
        let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "PopOverVC") as! PopOverViewController
        popoverContent.popDelegate = self
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: 200, height: 200)
        popover?.delegate = self
        popover?.sourceView = sender
        popover?.sourceRect = CGRect(x: 0, y: 0, width: 200, height: 200)
//        popover?.sourceRect = CGSize(width: 500, height: 600)
        
        self.present(nav, animated: true, completion: nil)
    }
    
    func reloadData(strFilter: String) {
         print(strFilter)

        if strFilter == "Forks Count"{
       arrItems = arrItems.sorted(by: { $0.forksCount > $1.forksCount })
        }
        
       else if strFilter == "Openissues Count"{
            arrItems = arrItems.sorted(by: { $0.openIssuesCount > $1.openIssuesCount })
        }
        else if strFilter == "Stargazers Count"{
            arrItems = arrItems.sorted(by: { $0.stargazersCount > $1.stargazersCount })
        }
        else if strFilter == "Watchers Count"{
            arrItems = arrItems.sorted(by: { $0.watchersCount > $1.watchersCount })
        }
        
        
        tableVW.reloadData()
    }
    
}



extension ViewController:UITableViewDataSource,UITableViewDelegate{
    /*.....Deligate methods for Tableview.......................*/
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if arrItems.isEmpty{
                lblNodata.isHidden = false
                self.tableVW.isHidden = true
            }else{
                lblNodata.isHidden = true
                self.tableVW.isHidden = false
            }
            
            return arrItems.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell:RepositoryCellTableViewCell = self.tableVW.dequeueReusableCell(withIdentifier: "RepCell") as! RepositoryCellTableViewCell
            
            let objItems = arrItems[indexPath.row]
    //        cell.lblName.text = objItems.name
            
            let firstAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.init(name: "HelveticaNeue-Light", size: 12) as Any]
            let secondAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.init(name: "HelveticaNeue-Light", size: 12) as Any]

            let firstString = NSMutableAttributedString(string: "Watchers: ", attributes: firstAttributes)
            let attributedQuote = NSAttributedString(string: String(objItems.watchersCount))

            let secondString = NSAttributedString(string: "  Forks: ", attributes: secondAttributes)
            let attributedQuote2 = NSAttributedString(string: String(objItems.forksCount))

            
            firstString.append(attributedQuote)
            firstString.append(secondString)
            firstString.append(attributedQuote2)

            
            cell.lblFullName.text = objItems.name + "(" + objItems.fullName + ")"
            cell.lblWatchCount.attributedText = firstString
    //        cell.lblCommitCount.text = String(objItems.forksCount)
            
            let urlString = objItems.owner.avatarURL
            let urlStr:NSString = urlString!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
            
             let url = URL(string:urlStr as String)
            let strurl = url?.absoluteString
            cell.ImageLogo.loadImageAsync(with: strurl, placeholder: "noimage_placeholder")
            
            
            return cell
            
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContributorVC") as? ContributorViewController
            vc?.objitemBo = arrItems[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
        }
        
}
