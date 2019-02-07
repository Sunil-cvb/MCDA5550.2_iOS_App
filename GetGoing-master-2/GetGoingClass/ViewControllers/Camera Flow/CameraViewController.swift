//
//  CameraViewController.swift
//  GetGoingClass
//
//  Created by MCDA on 2019-02-06.
//  Copyright © 2019 SMU. All rights reserved.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController {

    
    @IBOutlet weak var previewView: UIView!
    var session: AVCaptureSession?
    var photoOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var photo: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        session = AVCaptureSession()
        session?.sessionPreset = .photo
        guard let backCamera = AVCaptureDevice.default(for: .video) else {return}
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do{
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let cameraError as NSError{
            print(cameraError.localizedDescription)
            error =  cameraError
        }
        
        guard let session = session else {  return}
        if error == nil && session.canAddInput(input){
            session.addInput(input)
        }
        photoOutput = AVCapturePhotoOutput()
        if let output = photoOutput {
            if session.canAddOutput(output) {
                session.addOutput(output)
                
                previewLayer =  AVCaptureVideoPreviewLayer(session: session)
                previewLayer?.connection?.videoOrientation = .portrait
                previewLayer?.videoGravity = .resizeAspectFill
                if let layer = previewLayer {
                    previewView.layer.addSublayer(layer)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /*
    extension CameraViewController: AVCapturePhotoCaptureDelegate{
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapture)
    }*/
}
