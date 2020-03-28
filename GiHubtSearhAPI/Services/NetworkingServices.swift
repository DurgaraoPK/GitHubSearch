//
//  NetworkingServices.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//
import Foundation


class NetworkingServices {
    
    private init(){}
    static let shared = NetworkingServices();
    
    
    func getData(FromUrl:URL,Completion:@escaping(Data)->Void)  {
        
        
        let session  = URLSession.shared
        let  task = session.dataTask(with: FromUrl) { (data, response, error) in
            
            guard let respdata = data else {return}
            
            DispatchQueue.main.async {
            Completion(respdata)
            }
            
            
            
//            do{
//                let json = try JSONSerialization.jsonObject(with: respdata, options: [])
//                print(json)
//
//                let decoder = JSONDecoder()
//                let  codabledata = try decoder.decode(BaseRepoModel.self, from: respdata)
//                print(codabledata)
//                DispatchQueue.main.async {
//                    Completion(codabledata)
//                }
//
//            }catch let parsingError {
//                print("Error", parsingError)
//            }
            
        }
        task.resume()
    }
    
}
