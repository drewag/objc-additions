//
//  DWCGRectHelpers.h
//  objc-additions
//
//  Created by Andrew J Wagner on 8/31/13.
//  Copyright (c) 2013 Drewag LLC. All rights reserved.
//

static inline CGRect DWCGRectResize(CGRect rect, CGFloat deltaWidth, CGFloat deltaHeight) {
	return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width + deltaWidth, rect.size.height + deltaHeight);
}

static inline CGRect DWCGRectPosition(CGRect rect, CGFloat originX, CGFloat originY) {
	return CGRectMake(originX, originY, rect.size.width, rect.size.height);
}

static inline CGRect DWCGRectFromSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

static inline CGRect DWCGRectPositionSize(CGSize size, CGFloat originX, CGFloat originY) {
    return CGRectMake(originX, originY, size.width, size.height);
}

static inline CGFloat DWCGRectBottom(CGRect rect) {
    return rect.origin.y + rect.size.height;
}

static inline CGFloat DWCGRectRight(CGRect rect) {
    return rect.origin.x + rect.size.width;
}

static inline CGPoint DWCGRectCenter(CGRect rect) {
    return CGPointMake(
        rect.origin.x + rect.size.width / 2.0,
        rect.origin.y + rect.size.height / 2.0
    );
}

static inline CGSize DWCGSizeAspectFit(CGSize aspectRatio, CGSize boundingSize) {
    float mW = boundingSize.width / aspectRatio.width;
    float mH = boundingSize.height / aspectRatio.height;
    if( mH < mW )
        boundingSize.width = boundingSize.height / aspectRatio.height * aspectRatio.width;
    else if( mW < mH )
        boundingSize.height = boundingSize.width / aspectRatio.width * aspectRatio.height;
    return boundingSize;
}

static inline CGRect DWCGRectPinToBottomWithOffset(CGRect rect, CGFloat yOffset, CGFloat width, CGFloat height) {
    return CGRectMake(
        rect.origin.x,
        DWCGRectBottom(rect) + yOffset,
        width,
        height
    );
}