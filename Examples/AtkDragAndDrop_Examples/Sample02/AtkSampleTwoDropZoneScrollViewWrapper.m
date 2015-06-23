//
//  AtkSampleTwoDropZoneScrollViewWrapper.m
//  Atkdrogen_DragAndDrop
//
//  Created by Rick Boykin on 1/21/14.
//  Copyright (c) 2014 Asymptotik Limited. All rights reserved.
//

#import "AtkSampleTwoDropZoneScrollViewWrapper.h"
#import "UIScrollView+AtkDragAndDrop.h"

@interface AtkSampleTwoDropZoneScrollViewWrapper ()

@property (nonatomic, strong) UIColor *savedBackgroundColor;

@end

@implementation AtkSampleTwoDropZoneScrollViewWrapper

- (id)initWithScrollView:(UIScrollView *)view
{
    self = [super init];
    if(self)
    {
        self.view = view;
        [self initialize];
    }
    return self;
}

- (void)initialize
{
}

- (BOOL)dropZoneIsActive:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    return [self.view isActiveDropZone:manager point:point];
}

- (BOOL)dropZoneShouldDragStart:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneScrollView.shouldDragStart");
    return YES;
}

- (void)dropZoneDragStarted:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneScrollView.dragStarted");
}

- (BOOL)dropZoneIsInterested:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneScrollView.isInterested");
    return YES;
}

- (void)dropZoneDragEnded:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneScrollView.dragEnded");
}

- (void)dropZoneDragEntered:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneScrollView.dragEntered");
    self.savedBackgroundColor = self.view.backgroundColor;
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)dropZoneDragExited:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneScrollView.dragExited");
    self.view.backgroundColor = self.savedBackgroundColor;
}

- (void)dropZoneDragMoved:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
}

- (void)dropZoneDragDropped:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneScrollView.dragDropped");
    self.view.backgroundColor = [UIColor greenColor];
}

@end
