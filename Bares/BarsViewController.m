//
//  BarsViewController.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import "BarsViewController.h"
#import "Bars.h"
#import "Bar.h"
#import "DetailsViewController.h"

static NSString *kDefaultStarImage                              = @"star-on.png";
static NSString *kDefaultStarOffImage                           = @"star-off.png";

@interface BarsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *barImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) WPRateView *rateView;


@property (strong, nonatomic) NSArray *barArray;
@property (nonatomic) int barIndex;

@end

@implementation BarsViewController
@synthesize rateView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    Bars *barList = [[Bars alloc] initWithFile:@"bar_list"];
    
    self.barArray = [NSArray arrayWithArray:[barList allBars]];
    self.barIndex = 0;
    [self changeView];
    [self.view addSubview:self.rateView];
}

#pragma mark - Custom Better

-(WPRateView *)rateView
{
    if(!rateView){
        
        CGRect viewFrame  = self.ratingLabel.frame;
        viewFrame.origin.x = CGRectGetMaxX(self.ratingLabel.frame) + 20;
        
        rateView = [[WPRateView alloc] initWithFrame:viewFrame];
        rateView.notSelectedImage = [UIImage imageNamed:kDefaultStarOffImage];
        rateView.halfSelectedImage = nil;
        rateView.fullSelectedImage = [UIImage imageNamed:kDefaultStarImage];
        rateView.midMargin = 0;
        rateView.editable = YES;
        rateView.maxRating = 5;
        rateView.delegate = self;
        rateView.rating = 0;
    }
    return rateView;
}


#pragma mark - Private 

- (void)changeView {
    
    Bar *bar =  self.barArray[self.barIndex];
    self.title = bar.name;
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:bar.photo]];
    UIImage *image = [UIImage imageWithData:imageData];
    
    self.barImageView.image = image;
    
    self.addressLabel.text = [NSString stringWithFormat:@"Address: %@",bar.address];
    self.rateView.rating = (float)bar.rating;
    
}

- (IBAction)next:(UIButton *)sender {
    if((self.barIndex + 1)  == [self.barArray count] ) {
        self.barIndex = 0;
    } else {
        self.barIndex++;
    }
    [self changeView];
}

- (IBAction)goBack:(UIButton *)sender {
    if((self.barIndex - 1) < 0 ) {
        self.barIndex = [self.barArray count] - 1;
    } else {
        self.barIndex--;
    }
    [self changeView];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nextViewController"]) {
        DetailsViewController *detailsViewController = segue.destinationViewController;
        Bar *b = self.barArray[self.barIndex];
        
        detailsViewController.name = b.name;
        detailsViewController.descriptionText = b.descriptionText;
    }
}


@end
