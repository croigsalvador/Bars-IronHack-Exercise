//
//  DetailsViewController.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import "DetailsViewController.h"
#import <MapKit/MapKit.h>

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DetailsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"Description %@", self.descriptionText);
    self.descriptionTextView.text = self.descriptionText;
    self.title = self.name;
    self.nameLabel.text = self.name;
    
}





@end
