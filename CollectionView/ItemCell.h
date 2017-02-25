//
//  ItemCell.h
//  CollectionView
//
//  Created by irekasoft on 2/25/17.
//  Copyright © 2017 irekasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//UICollectionViewCell

@interface ItemCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIImageView *iv_main;

@end
