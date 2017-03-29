//
//  ViewController.m
//  iWeather
//
//  Created by Nguyen Minh Tan on 3/28/17.
//  Copyright © 2017 Torginization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
}

//Có dấu trừ trước khai báo là instant method
//Có dấu + trước khai báo là class method
//(float) casting: chuyển, ép sang kiểu float

- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}

@end
