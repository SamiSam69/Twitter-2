//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Saurav Maharjan on 9/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetConent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetID: Int = -1
    
    //Actions
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorite = !favorited
        if (tobeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failute: { (error) in
                print("Favorite dId not Succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failute: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failute: { (error) in
            print("Error in Retweeting: \(error)")
        })
        
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                                    UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            
            retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                                    UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
    }
    

    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for:
                                UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    /////
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
