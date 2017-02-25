//
//  ViewController.m
//  CollectionView
//
//  Created by irekasoft on 2/25/17.
//  Copyright © 2017 irekasoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  list = @[];
  
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  
  [SVProgressHUD showWithStatus:@"Loading..."];
  
  NSString *urlString = [NSString stringWithFormat:@"https://irekaweb.com/api/demo/amazing_places/list"];
  
  [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    
    list = responseObject;
    
    [self.collectionView reloadData];
    
    [SVProgressHUD dismiss];
    
  } failure:^(NSURLSessionTask *operation, NSError *error) {
    
    NSLog(@"Error: %@", error);
    [SVProgressHUD dismiss];
    
  }];
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// UICollectionViewDelegate, UICollectionViewDataSource

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
  return list.count;
  
  
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
  ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  
  NSDictionary *dict = list[indexPath.row];
  
  NSString *name = dict[@"title"];
  
  NSString *coordinate = dict[@"coordinate"];
  
  NSString *text = [NSString stringWithFormat:@"%ld)%@", indexPath.row+1, name];

    NSURL *url = [NSURL URLWithString:dict[@"image_url"]];
  
  
  [cell.iv_main setImageWithURL:url placeholderImage:nil];
  
  cell.lbl_title.text = name;
  
  return cell;
  
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
  NSLog(@"hello");
  
}


@end
