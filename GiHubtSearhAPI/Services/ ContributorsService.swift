//
//   ContributorsService.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import Foundation
class  ContributorsService {
    
    private init(){}
    
    static func getPosts(str:String, Completion:@escaping([ContributorsListModel])->Void){
        
        
        
        
        let urlStr:NSString = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! as NSString
        
        guard let url = URL(string:urlStr as String) else { return }
        
        NetworkingServices.shared.getData(FromUrl: url) { (RespData) in
            
            do{
                
                let decoder = JSONDecoder()
                let  codabledata = try decoder.decode([ContributorsListModel].self, from: RespData)
                print(codabledata)
                Completion(codabledata)
                
            }catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        
    }
}
