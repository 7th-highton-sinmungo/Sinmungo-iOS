//
//  ImagePicker.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var requests: [UploadRequest]

    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: PHPickerViewControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for result in results {
                var request = UploadRequest()
                
                let provider = result.itemProvider
                provider.loadFileRepresentation(forTypeIdentifier: "public.item") { url, error in
                    DispatchQueue.main.async {
                        request.name = url?.lastPathComponent ?? ""
                        request.type = ImageType(rawValue: url?.pathExtension ?? "") ?? ImageType.UNKNOWN
                        if url?.pathExtension == "jpg" {
                            request.type = ImageType.JPEG
                        }
                    }
                }
                if provider.canLoadObject(ofClass: UIImage.self) {
                    provider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                        if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                request.image = image
                                self?.parent.requests.append(request)
                            }
                        }
                    }
                }
            }
            
            picker.dismiss(animated: true)
        }
    }
}
