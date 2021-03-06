//
//  FYBannerItem.m
//  Pods
//
//  Created by Frankenstein Yang on 4/28/16.
//
//

#import <Masonry/Masonry.h>
#import <libextobjc/EXTScope.h>

#import "FYBannerItem.h"

@implementation FYBannerItem

- (void)dealloc {
    
    _imageView = nil;
    _placeHolderImageView =nil;
    _placeHolderImage = nil;
    _url = nil;
    
}

- (instancetype)initWithFrame:(CGRect)frame
             placeHolderImage:(UIImage *)placeHolderImage {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        [self addSubview:self.imageView];
        [self addSubview:self.placeHolderImageView];
        [self makeConstraints];
        
        self.placeHolderImage = placeHolderImage;
    }
    return self;
    
}

- (void)setImage:(UIImage *)image {
    
    self.hasSetImage = YES;
    [self.placeHolderImageView setHidden:YES];
    [self.imageView setImage:image];
    
}

#pragma mark - 懒加载

- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.userInteractionEnabled = YES;
        [_imageView setContentMode:UIViewContentModeScaleToFill];
    }
    return _imageView;
    
}

-(UIImageView *)placeHolderImageView {
    
    if (!_placeHolderImageView) {
        
        _placeHolderImageView = [[UIImageView alloc] init];
        [_placeHolderImageView setContentMode:UIViewContentModeScaleToFill];
    }
    return _placeHolderImageView;
    
}

#pragma mark - Setter

- (void)setPlaceHolderImage:(UIImage *)placeHolderImage {
    
    if (!placeHolderImage) {
        
        return;
    }
    _placeHolderImage = placeHolderImage;
    [self.placeHolderImageView setImage:_placeHolderImage];
    
}

#pragma mark - 约束

- (void)makeConstraints {
    @weakify(self);
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
    
    [self.placeHolderImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
}

@end
