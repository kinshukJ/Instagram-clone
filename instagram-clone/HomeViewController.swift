//
//  HomeViewController.swift
//  instagram-clone
//
//  Created by Kinshuk Juneja on 3/12/17.
//

import UIKit
import Parse
import AFNetworking

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var posts: [PFObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // construct PFQuery
        tableView.dataSource = self
        tableView.delegate = self
        
        let query = PFQuery.init(className: "Post")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if error == nil {
                self.posts = posts!
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "error")
            }
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! InstagramPostTableViewCell
        let post = posts[indexPath.row]
        
        // fetch data asynchronously let post = posts[indexPath.row]
        
        cell.captionlabel.text = post["caption"] as? String
        if let postImage = post.value(forKey: "media") as? PFFile {
            postImage.getDataInBackground(block: { (imageData: Data?, error: Error?) in
                guard let data = imageData else {
                    return
                }
                cell.photoView.image = UIImage(data: data)
            })
        }


        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return posts.count
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
