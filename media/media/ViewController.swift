//
//  ViewController.swift
//  media
//
//  Created by Aileen Pierce on 11/14/14.
//  Copyright (c) 2014 Aileen Pierce. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    var videoURL : NSURL?

    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        //checks the device to make sure it has a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            //creates an instance of the image picker controller
            var imagePickerController=UIImagePickerController()
            //sets the delegate so it can find out when the picture is ready
            imagePickerController.delegate=self
            //use the camera interface
            imagePickerController.sourceType=UIImagePickerControllerSourceType.Camera
            //display camera controls
            imagePickerController.mediaTypes=[kUTTypeImage, kUTTypeMovie]
            //present the camera interface
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        else {
            println("Can't access the camera")
        }
    }
    
    //UIImagePickerControllerDelegate method
    //called after successfully taking a picture or video
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        //media type tell us whether it was a picture or a video
        let mediaType = info[UIImagePickerControllerMediaType] as String
        image = nil
        imageView.image = nil
        videoURL = nil
        if mediaType == kUTTypeImage { //image
            //the original, unmodified image from the camera
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView.image=image
        }
        else if mediaType == kUTTypeMovie { //movie
            videoURL = info[UIImagePickerControllerMediaURL] as? NSURL
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func actionButonTapped(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let roll=UIAlertAction(title: "Camera Roll", style:UIAlertActionStyle.Default, handler: { action in
            var imagePickerController=UIImagePickerController()
            imagePickerController.delegate=self
            imagePickerController.sourceType=UIImagePickerControllerSourceType.SavedPhotosAlbum
            imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.SavedPhotosAlbum)!
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        })
        actionSheet.addAction(roll)
        let cancel=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        if (image != nil) {
            let save=UIAlertAction(title: "Save Image", style:UIAlertActionStyle.Default, handler:  { action in
                UIImageWriteToSavedPhotosAlbum(self.image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
            })
            actionSheet.addAction(save)
        }
        if (videoURL != nil) {
            let urlString = videoURL?.path
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlString){
                let save=UIAlertAction(title: "Save Video", style:UIAlertActionStyle.Default, handler:  { action in
                    UISaveVideoAtPathToSavedPhotosAlbum(urlString, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
                })
            actionSheet.addAction(save)
            }
        }
        presentViewController(actionSheet, animated: true, completion: nil)
    }

    func image(image: AnyObject, didFinishSavingWithError error: NSError?, contextInfo: UnsafePointer<Void>) {
        if let saveError=error{
            let errorAlert=UIAlertController(title: "Error", message:saveError.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
            errorAlert.addAction(cancelAction)
            presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
            let successAlert=UIAlertController(title: "Success", message: "Successfully saved to camera roll.", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
            successAlert.addAction(okAction)
            presentViewController(successAlert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

