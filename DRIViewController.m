//
//  DRIViewController.m
//  DrinkingMemeDado
//
//  Created by Marcelo Garcia on 12/03/14.
//  Copyright (c) 2014 com.bit4All.MemeDado. All rights reserved.
//

#import "DRIViewController.h"

@interface DRIViewController ()
{
    int num ;
    NSNumber *numberDado;
}

@end

@implementation DRIViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.beaconDictionary = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.perimetral = [[CBPeripheralManager alloc]initWithDelegate:self queue:nil options:nil];
    
}

-(int)getRandomNumberBetween:(int)from to:(int)to
{
    
    return (int)from + arc4random() %( to -from  +1);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSend:(UIButton *)sender {
    self.beaconDictionary = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.perimetral = [[CBPeripheralManager alloc]initWithDelegate:self queue:nil options:nil];
    
    
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        //se o bluetooth estiver ligado
        NSLog(@"bluetooth ligado");
        self.textSend.text =@"bluetooth ligado";
        [self.perimetral startAdvertising:self.beaconDictionary ];
        
    }
    else if (peripheral.state==CBPeripheralManagerStatePoweredOff)
    {
        NSLog(@"Bluetooth desligado");
          self.textSend.text =@"bluetooth desligado";
        [self.perimetral stopAdvertising];
    }
    
    else if (peripheral.state == CBPeripheralManagerStateUnauthorized)
    {
        NSLog(@"Não suporttado pelo ibeacon");
          self.textSend.text =@"Não Suportado";
    }
    
   
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    num = [self getRandomNumberBetween:1 to:6];
    
    
    NSLog(@"RANDOM %d",num);
    NSString *num1 = [NSString stringWithFormat:@"%d",(int)num];
    self.lblRandom.text = num1;
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:@"D654791D-4980-46A3-9B24-CD23318E7F83"];
    NSInteger major1r= [[NSDate date]timeIntervalSince1970];
    NSLog(@"TEMPO %d",major1r);
    
    self.beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid major:major1r  minor:num identifier:@"bepid.DrinkinMemeDado"];
    self.beaconDictionary = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.perimetral = [[CBPeripheralManager alloc]initWithDelegate:self queue:nil options:nil];
    UIImageView *dado=[[UIImageView alloc]init];
    dado.animationImages =[NSArray  arrayWithObjects:[UIImage imageNamed:@"dic"], nil] ;
    [self.view addSubview:dado];
    dado.animationDuration = 2.0;
    [dado startAnimating];
    
}
- (IBAction)btDadoAction:(UIButton *)sender {
//    num = [self getRandomNumberBetween:1 to:6];
//
//    
//    NSLog(@"RANDOM %d",num);
//    NSString *num1 = [NSString stringWithFormat:@"%d",(int)num];
//    self.lblRandom.text = num1;
//        NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:@"D654791D-4980-46A3-9B24-CD23318E7F83"];
//    NSInteger major1r= [[NSDate date]timeIntervalSince1970];
//    NSLog(@"TEMPO %d",major1r);
//    
//      self.beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid major:major1r  minor:num identifier:@"bepid.DrinkinMemeDado"];
    
   
  
    

}
@end
