//
//  ImageViewerModels.swift
//  PixaSearch
//
//  Created by Thierry on 2023/04/19.
//  Copyright (c) 2023. All rights reserved.
//

enum ImageViewer {

    enum Display {
        struct Request {}

        struct Response {
            let images: [PixaImage]
        }

        struct ViewModel {
            let models: [ImageViewer.ViewModel]
        }
    }

    struct ViewModel {
        let imagePath: String
        let userName: String
    }
}
