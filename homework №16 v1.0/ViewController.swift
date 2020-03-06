//
//  ViewController.swift
//  homework №16
//
//  Created by Shirayo on 06.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var photos: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos.append(Photos(photoName: "Apple", image: UIImage(named: "apple")!))
        photos.append(Photos(photoName: "Apple", image: UIImage(named: "apple")!))
        photos.append(Photos(photoName: "Apple", image: UIImage(named: "apple")!))
        photos.append(Photos(photoName: "Apple", image: UIImage(named: "apple")!))

        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fillDataViewController = segue.destination as! AddPhotoViewController
        fillDataViewController.modalPresentationStyle = .fullScreen
        fillDataViewController.finishHandler = setPhoto
    }
    
    
    func setPhoto (_ photo: Photos) {
        photos.append(photo)
        tableView.reloadData()
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell") as! PhotoTableViewCell
        cell.setPhoto(photos: photos[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
