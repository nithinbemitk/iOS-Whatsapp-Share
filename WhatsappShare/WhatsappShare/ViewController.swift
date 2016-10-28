//
//  ViewController.swift
//  WhatsappShare
//
//  Created by Nithin.k on 28/10/16.
//  Copyright © 2016 NK Dreams. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var documentInteractionController: UIDocumentInteractionController = UIDocumentInteractionController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func whatsappShareWithoutImage(_ sender: AnyObject)
    {
        let originalString = "First Whatsapp Share"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)

        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")

        //Text which will be shared on WhatsApp is: "First Whatsapp Share"
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func whatsappShareLink(_ sender: AnyObject)
    {
        let originalString = "https://www.google.co.in"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }

    @IBAction func whatsappShareWithImages(_ sender: AnyObject)
    {
      
        let urlWhats = "whatsapp://app"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    
                    if let image = UIImage(named: "whatsappIcon") {
                        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
                            let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsAppTmp.wai")
                            do {
                                try imageData.write(to: tempFile, options: .atomic)
                                self.documentInteractionController = UIDocumentInteractionController(url: tempFile)
                                self.documentInteractionController.uti = "net.whatsapp.image"
                                self.documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                                
                            } catch {
                                print(error)
                            }
                        }
                    }
                    
                } else {
                    // Cannot open whatsapp
                }
            }
        }
 
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

