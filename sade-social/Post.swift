//
//  Post.swift
//  sade-social
//
//  Created by sade on 7/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import Foundation

class Post {
    
    private var _caption: String!
    private var _imagURL: String!
    private var _likes:Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    
    var imgeURL: String {
        return _imagURL
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageURL: String, likes: Int) {
        self._caption = caption
        self._imagURL = imageURL
        self._likes = likes
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String{
            self._caption = caption
        }
        
        if let imageURL = postData["imageURL"] as? String{
            self._imagURL = imageURL
        }
        
        if let likes = postData["likes"] as? Int{
            self._likes = likes
        }
        
    }
}
