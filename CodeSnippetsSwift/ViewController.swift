//
//  ViewController.swift
//  CodeSnippetsSwift
//
//  Created by Paulo Silva on 19/01/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import UIKit
import Foundation

import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var bearerValue : String?
    var imageUpload : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.restAutentication()
        //self.restAuthorization()
        //self.restPostUser()
        //self.restPostCompany()
        //self.restGetCompanies()
        //self.restGetCompany()
        //self.restPutCompany()
        //self.restDeleteCompany()
        
        //
        self.downloadImageTaskFromUrl(urlString: "http://asynapse.pt/web/image/820")
        
        //
        //self.alamofireAuthentication()
        //self.alamofireAuthorization()
        
        //
        //self.alamofirePostCompany()
        //self.alamofireGetCompanies()
        //self.alamofireGetCompany()
        //self.alamofirePutCompany()
        
        //
        //self.alamofireDownloadImage()
        //self.alamofireDownloadImageTo()
        //self.alamofireDownloadImageWithStatus()
        //self.alamofireDownloadImageWithStatusAndQueue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // PS-Rest-Authentication
    func restAutentication() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers = [
            "authorization": "Basic c2lsdmEucG1vQGdtYWlsLmNvbTpzYSEyMDE3",
            "content-type": "application/json"
        ]
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/login")!)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("This is the data: \(String(describing: dataString))") //JSONSerialization
                
            }
        })
        
        dataTask.resume()
        
    }
    
    // PS-Rest-Authorization
    func restAuthorization() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers = [
            "authorization": "Bearer 2bSB1eAqcYKb/82YZ0VKGQ==",
            "content-type": "application/json"
        ]
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/me")!)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("This is the data: \(String(describing: dataString))") //JSONSerialization
                
            }
        })
        
        dataTask.resume()
        
    }
    
    // PS-Rest-Post-User
    func restPostUser() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        do {
            
            let headers = ["content-type": "application/json"]
            let parameters = [
                "name": "paulosilva",
                "email": "silva.pmo@gmail.com",
                "password": "sa!2017",
                "mobileNumber": "963080856"
            ]
            
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/users")!)
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.allHTTPHeaderFields = headers
            request.httpBody = postData
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("This is the data: \(String(describing: dataString))") //JSONSerialization
                    
                }
            })
            
            dataTask.resume()
            
        } catch {}
        
    }
    
    // PS-Rest-Post-Request
    func restPostCompany() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        do {
            
            let headers = ["content-type": "application/json"]
            let parameters = ["name": "my company"]
            
            let postData = try JSONSerialization.data(withJSONObject: parameters, options:[])
            
            let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/companies")!)
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.allHTTPHeaderFields = headers
            request.httpBody = postData
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("This is the data: \(String(describing: dataString))") //JSONSerialization
                    
                }
            })
            
            dataTask.resume()
            
        } catch {}
    }
    
    // PS-Rest-Get-All-Request
    func restGetCompanies() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers = ["content-type": "application/json"]
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/companies")!)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("This is the data: \(String(describing: dataString))") //JSONSerialization
                
            }
        })
        
        dataTask.resume()
        
    }
    
    // PS-Rest-Get-Request
    func restGetCompany() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers = ["content-type": "application/json"]
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/companies/1")!)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("This is the data: \(String(describing: dataString))") //JSONSerialization
                
            }
        })
        
        dataTask.resume()
    }
    
    // PS-Rest-Put-Request
    func restPutCompany() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        do {
            
            let headers = ["content-type": "application/json"]
            let parameters = ["name": "My Company 2"]
            
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let request = NSMutableURLRequest(url: URL(string: "http://localhost:8080/companies/2")!)
            request.httpMethod = "PUT"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.allHTTPHeaderFields = headers
            request.httpBody = postData
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("This is the data: \(String(describing: dataString))") //JSONSerialization
                    
                }
            })
            
            dataTask.resume()
            
        } catch {}
    }
    
    // PS-Rest-Delete-Request
    func restDeleteCompany() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers = ["content-type": "application/json"]
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8080/companies/4")! as URL)
        request.httpMethod = "DELETE"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("This is the data: \(String(describing: dataString))") //JSONSerialization
                
            }
        })
        
        dataTask.resume()
    }
    
    // PS-Download-Image-Async
    func downloadImageAsync() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        // http://asynapse.pt/web/image/820
        //
    }
    
    // PS-Download-Image-Task
    func downloadImageTaskFromUrl(urlString: String) {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        // http://asynapse.pt/web/image/820
        //
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                //print(image!)
                self.imageView.image = image
            })
            
        }).resume()
    }
    
    // PS-Download-Data-FromUrl-Task
    func downloadDataTaskFrom(url: URL, to localUrl: URL, completion: @escaping () -> ()) {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        // http://asynapse.pt/web/image/820
        //
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: localUrl)
                    completion()
                } catch (let writeError) {
                    print("error writing file \(localUrl) : \(writeError)")
                }
                
            } else {
                print("Failure: %@", error?.localizedDescription as Any);
            }
        }
        task.resume()
    }
    
    // PS-Doanload-Data-Task
    func downloadDataTask2From() {
        //
        //import Foundation
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        // http://asynapse.pt/web/image/820
        //
        
        // Create destination URL
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent("downloadedFile.jpg")
        
        //Create URL to the source file you want to download
        let fileURL = URL(string: "http://asynapse.pt/web/image/820")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let request = URLRequest(url:fileURL!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription as Any);
            }
        }
        task.resume()
        
    }
    
    // Podfile
    // Alamofire
    
    // PS-Alamofire-Authentication
    func alamofireAuthentication() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //

        // "authorization": "Basic c2lsdmEucG1vQGdtYWlsLmNvbTpzYSEyMDE3"
        let user = "silva.pmo@gmail.com"
        let password = "sa!2017"
        
        var headers: HTTPHeaders = [:]
        
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request("http://localhost:8080/login", method: .post, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
        /*
        let headers: HTTPHeaders = [
            "authorization": "Basic c2lsdmEucG1vQGdtYWlsLmNvbTpzYSEyMDE3",
            "content-type": "application/json"
        ]
        
        Alamofire.request("http://localhost:8080/login", method: .post, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        */
        
    }
    
    // PS-Alamofire-Authorization
    func alamofireAuthorization() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers: HTTPHeaders = [
            "authorization": "Bearer ytmhQH8r1woxRxIpdxlODQ==",
            "content-type": "application/json"
        ]
        
        /*
        Alamofire.request("http://localhost:8080/me", method: .get, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        */
        
        Alamofire.request("http://localhost:8080/me", method: .get, headers: headers).responseString { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Post-Request
    func alamofirePostCompany() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers: HTTPHeaders = [
            "content-type": "application/json"
        ]
        
        let parameters: Parameters = [
            "name": "My Company Z"
        ]
        
        Alamofire.request("http://localhost:8080/companies", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Get-All-Request
    func alamofireGetCompanies() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers: HTTPHeaders = [
            "content-type": "application/json"
        ]
        
        Alamofire.request("http://localhost:8080/companies", method: .get, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Get-Request
    func alamofireGetCompany() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers: HTTPHeaders = [
            "content-type": "application/json"
        ]
        
        Alamofire.request("http://localhost:8080/companies/1", method: .get, headers: headers).responseJSON { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Put-Request
    func alamofirePutCompany() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let headers: HTTPHeaders = [
            "content-type": "application/json"
        ]
        
        let parameters: Parameters = [
            "name": "My Company YZ"
        ]
        
        Alamofire.request("http://localhost:8080/companies/6", method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
    
    // PS-Alamofire-Download-Image
    func alamofireDownloadImage() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        Alamofire.download("http://asynapse.pt/web/image/820").responseData { response in
            print(response)
            
            if let data = response.result.value {
                let image = UIImage(data: data)
                self.imageUpload = image

                self.imageView.image = image;
            }
        }
        
    }
    
    // PS-Alamofire-Download-Image-To
    func alamofireDownloadImageTo() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("pig.png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        let urlString = "http://asynapse.pt/web/image/820"
        
        Alamofire.download(urlString, to: destination).response { response in
            print(response)
            
            if response.error == nil, let imagePath = response.destinationURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
                self.imageUpload = image

                self.imageView.image = image;
            }
        }
        
    }
    
    // PS-Alamofire-Download-Image-With-Status
    func alamofireDownloadImageWithStatus() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        Alamofire.download("http://asynapse.pt/web/image/820")
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    self.imageUpload = image

                    self.imageView.image = image;
                }
            }
        
    }
    
    // PS-Alamofire-Download-Image-With-Status
    func alamofireDownloadImageWithStatusAndQueue() {
        //
        // import Alamofire
        //
        // info.plist
        // NSAppTransportSecurity | NSAllowsArbitraryLoads | YES
        //
        
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.download("https://httpbin.org/image/png")
            .downloadProgress(queue: utilityQueue) { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    self.imageUpload = image
                    
                    self.imageView.image = image;
                }
            }
        
    }
    
    // PS-Alamofire-Uploading-Data
    func alamofireUploadingData() {
        //
        // import Alamofire
        //
        
        let imageData = self.imageUpload!.pngData()!
        
        Alamofire.upload(imageData, to: "https://httpbin.org/post").responseJSON { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Uploading-File
    func alamofireUploadingFile() {
        //
        // import Alamofire
        //
        
        let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
        
        Alamofire.upload(fileURL!, to: "https://httpbin.org/post").responseJSON { response in
            debugPrint(response)
        }
        
    }
    
    // PS-Alamofire-Uploading-Multipart-Form
    func alamofireUploadingMultipartForm() {
        //
        // import Alamofire
        //
        
        let unicornImageURL = Bundle.main.url(forResource: "unicorn", withExtension: "png")
        let rainbowImageURL = Bundle.main.url(forResource: "rainbow", withExtension: "png")
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(unicornImageURL!, withName: "unicorn")
                multipartFormData.append(rainbowImageURL!, withName: "rainbow")
        },
            to: "https://httpbin.org/post",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
    }
    
    // PS-Alamofire-Upload-Progress
    func alamofireUploadProgress() {
        //
        // import Alamofire
        //
        
        let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
        
        Alamofire.upload(fileURL!, to: "https://httpbin.org/post")
            .uploadProgress { progress in // main queue by default
                print("Upload Progress: \(progress.fractionCompleted)")
            }
            .downloadProgress { progress in // main queue by default
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseJSON { response in
                debugPrint(response)
        }
        
    }

    
}

