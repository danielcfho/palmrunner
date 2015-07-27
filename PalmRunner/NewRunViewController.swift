//
//  NewRunViewController.swift
//  PalmRunner
//
//  Created by Ho Daniel on 9/5/15.
//  Copyright (c) 2015 rm-3d.com. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class NewRunViewController: UIViewController, UIActionSheetDelegate, CLLocationManagerDelegate {

    var managedObjectContext:NSManagedObjectContext?
    let detailSegueName = "RunDetails"
    let run:Run = Run()
    
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var seconds:Int = 0
    var distance:Float = 0.0
    let locationManager = CLLocationManager()
    var locations = Array<Location>()
    var timer = NSTimer()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startButton.hidden = false
        promptLabel.hidden = false
        timeLabel.text = ""
        timeLabel.hidden = true
        distLabel.hidden = true
        paceLabel.hidden = true
        stopButton.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func eachSecond(){
        seconds++
        timeLabel.text = String(format: "Time: %@", MathController.stringigySecondCount(seconds, longFormat: false))
        distLabel.text = String(format: "Distance: %@", MathController.stringifyDistance(distance))
        paceLabel.text = String(format: "Pace: %@", MathController.stringifyAvgPaceFromDist(distance, seconds: seconds))
    }
    
    func startLocationUpdates(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = CLActivityType.Fitness
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func startPressed(sender: AnyObject) {
        startButton.hidden = true
        promptLabel.hidden = true
        timeLabel.hidden = false
        distLabel.hidden = false
        paceLabel.hidden = false
        stopButton.hidden = false
        
        seconds = 0
        distance = 0
        locations = Array<Location>()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector(eachSecond()), userInfo: nil, repeats: true)
        startLocationUpdates()
    }

    @IBAction func stopPressed(sender: AnyObject) {
        let actionSheet = UIActionSheet(title: "", delegate: self,
            cancelButtonTitle: "Cancel",
            destructiveButtonTitle: nil,
            otherButtonTitles: "Save",
            "Discard")
        actionSheet.showInView(self.view)
    }
    
    //MARK: - Action Sheet Delegate Method
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        //save
        if(buttonIndex==0){
            self.performSegueWithIdentifier(detailSegueName, sender: nil)
        }else if(buttonIndex==1){
            //discard
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
