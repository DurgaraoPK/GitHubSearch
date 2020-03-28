//
//  PostNetworking.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//
import Foundation


class PostNetworking{
    
    private init(){}
    
    static func getPosts(str:String, Completion:@escaping(BaseRepoModel)->Void){
        
        let urlString = "https://api.github.com/search/repositories?q=\(str)&sort=watchers_count&order=desc"
        

        let urlStr:NSString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        guard let url = URL(string:urlStr as String) else { return }
        
        NetworkingServices.shared.getData(FromUrl: url) { (RespData) in
            
        do{
            
            let decoder = JSONDecoder()
            let  codabledata = try decoder.decode(BaseRepoModel.self, from: RespData)
            print(codabledata)
            Completion(codabledata)
            
        }catch let parsingError {
        print("Error", parsingError)
        }
            
        }
 
    }
}

