//
//  IAViewController.h
//  IronApp
//
//  Created by Joel Humberto Gómez Paredes on 23/08/14.
//  Copyright (c) 2014 Joel Humberto Gómez Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <CoreMotion/CoreMotion.h>
@interface IAViewController : UIViewController

@property (strong, nonatomic) AVAudioPlayer* repulsor;
@property (strong, nonatomic) CMMotionManager* moves;
@end
