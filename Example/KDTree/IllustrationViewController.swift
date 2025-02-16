//
//  IllustrationViewController.swift
//  KDTree
//
// Copyright (c) 2020 mathHeartCode UG(haftungsbeschränkt) <konrad@mathheartcode.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class IllustrationViewController: UIViewController {

    @IBOutlet weak var illustrationView: IllustrationView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tappedLabel: UILabel!
    @IBOutlet weak var nearestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(IllustrationViewController.illustrationTapped(_:)))
        illustrationView.addGestureRecognizer(tapGR)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Navigation
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        illustrationView.isKNearest = sender.selectedSegmentIndex == 1
    }
    
    @IBAction func pointsSliderChanged(_ sender: UISlider) {
        illustrationView.pointNumber = Int(sender.value)
        pointsLabel.text = "Points: \(illustrationView.pointNumber)"
        
    }
    
    @objc func illustrationTapped(_ recognizer: UITapGestureRecognizer) {
        let point = recognizer.location(in: recognizer.view)
        illustrationView.pointTapped(point)
        
        tappedLabel.text = illustrationView.tappedPoint.flatMap({"Tapped: \($0.shortDecimalDescription)"}) ?? "Tapped: nil"
        nearestLabel.text = illustrationView.nearestPoints.first.flatMap({"Nearest: \($0.shortDecimalDescription)"}) ?? "Nearest: nil"
    }
    
}
