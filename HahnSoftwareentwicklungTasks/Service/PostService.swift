//
//  PostService.swift
//  Task
//
//  Created by LokeshReddy on 09/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation
class WebService{
    func parsingJSON(forResource:String,ofType:String,completion: @escaping ([Display]) -> ()) {
    guard let path = Bundle.main.path(forResource: forResource, ofType: ofType) else{return}
    let url = URL(fileURLWithPath: path)
    do{
        let jsonData = try Data(contentsOf: url)
         let response = try? JSONDecoder().decode([Display].self, from: jsonData)
       // print(jsonData)
                   if let response = response {
                  //  print(response[0].GEN)
                    print(response)
                       DispatchQueue.main.async {
                           completion(response)
                       }
                   }
                   
    }catch{
        print(error.localizedDescription)
    }
    }
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }

        }.resume()
    }
}
