//
//  DRIViewController.h
//  DrinkingMemeDado
//
//  Created by Marcelo Garcia on 12/03/14.
//  Copyright (c) 2014 com.bit4All.MemeDado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface DRIViewController : UIViewController<CBPeripheralManagerDelegate>
- (IBAction)btDadoAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btDado;
- (IBAction)buttonSend:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblRandom;
@property (weak, nonatomic) IBOutlet UIButton *buttonSend;
@property (weak, nonatomic) IBOutlet UITextField *textSend;
@property(strong,nonatomic) CLBeaconRegion *beaconRegion;
@property (strong,nonatomic) NSDictionary *beaconDictionary;
@property (strong,nonatomic)CBPeripheralManager *perimetral;
-(int)getRandomNumberBetween:(int) from to:(int)to;// metodo para o random




@end
