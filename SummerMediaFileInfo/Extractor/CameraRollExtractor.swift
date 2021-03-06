//
//  CameraRollExtractor.swift
//  SummerMediaFileInfo
//
//  Created by Kang Jinyeoung on 05/10/2017.
//  Copyright © 2017 SuperbDerrick. All rights reserved.
//

import Foundation
import Photos

class CameraRollExtractor: SummerExtractor{
  
  // MARK: Properties
  var allFiles: PHFetchResult<PHAsset>?
  
  override init() {
    super.init()
    
    self.processor = CameraRollProcessor()
  }
  
  override func setup(fileType: FileTypes , isBringUnknownFile: Bool) {
    
    setupInternal()

  }
  
  override func start() {
    
    if let files = self.allFiles {
      if let cameraProcessor = self.processor as? CameraRollProcessor {
        let testValue = cameraProcessor.startProcessing(files)
        
        for file in testValue {
                  print("fileName = \(file.fileName)")
                  print("fileFormat = \(file.fileFormat)")
                  print("filelocal = \(file.fileIdentifier)")
                  print("fileType = \(file.mediaType)")
        }
        
        
      } else {
        print("Casting Error")
      }
      
    } else {
       print("Nothing Files")
    }
    
  }
  
  fileprivate func setupInternal(){
    setupPHAsset()
  }
  
  fileprivate func setupPHAsset() {
    let allFilesOptions = PHFetchOptions()
    allFilesOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
    allFiles = PHAsset.fetchAssets(with: allFilesOptions)
    
  }
  
}
