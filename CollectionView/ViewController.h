//
//  ViewController.h
//  CollectionView
//
//  Created by irekasoft on 2/25/17.
//  Copyright © 2017 irekasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

#import "SVProgressHUD.h"
#import "UIImageView+AFNetworking.h"

#import "ItemCell.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>{
  
  NSArray *list;
  
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

