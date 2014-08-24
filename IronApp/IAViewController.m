//
//  IAViewController.m
//  IronApp
//
//  Created by Joel Humberto Gómez Paredes on 23/08/14.
//  Copyright (c) 2014 Joel Humberto Gómez Paredes. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()
{

    bool canPlay;
    double medida;

}
@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    canPlay = false;
    medida = 0.0;
    AVAudioPlayer* audio_repulsor=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"repulsor"ofType:@"mp3"]] error:NULL];
    _repulsor = audio_repulsor;
    _moves = [[CMMotionManager alloc] init];
    if (_moves.accelerometerAvailable)
    {
        _moves.accelerometerUpdateInterval = 0.1;
        [_moves startAccelerometerUpdatesToQueue:
         [NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error)
         {
             double y = fabs(accelerometerData.acceleration.y);
             if (y > 0.80) {
                 if (medida< 0.8) {
                     canPlay = true;
                 }else{
                     canPlay = false;
                 }
            } else {
                canPlay = false;

             }
             medida = y;
            
             if (canPlay  ) {
                 
                 if(![_repulsor isPlaying]){
                     [_repulsor play];
                 }
                // NSLog(@"Suena Y: %f", y);
             } else{
                // NSLog(@"%f",y);
             }
            
         }
         ];
        
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
