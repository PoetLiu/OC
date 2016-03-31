//
//  DrawView.m
//  TouchTracker
//
//  Created by liupeng on 16/3/31.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void) strokeLine:(Line *)line {
	UIBezierPath *path = [[UIBezierPath alloc] init];
	path.lineWidth	= self.lineThickness;
	path.lineCapStyle	= kCGLineCapRound;

	[path moveToPoint:line.begin];
	[path addLineToPoint:line.end];
	[path stroke];
}

- (void) drawRect:(CGRect)rect {
	// Draw finished lines in black
	[self.finishedLineColor setStroke];
	for (Line *line in self.finishedLines) {
		[self strokeLine:line];
	}
	
	[self.currentLineColor setStroke];
	for (Line *line in [self.currentLines allValues]) {
		[self strokeLine:line];
	}
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [touches allObjects]) {
		CGPoint location = [touch locationInView:self];
		Line *newLine	= [[Line alloc] initWithBegin:location end:location];
		NSValue *key	= [NSValue valueWithNonretainedObject:touch];
		if	(self.currentLines == nil) {
			self.currentLines	= [[NSMutableDictionary alloc] initWithCapacity:5];
		}
		[self.currentLines setObject:newLine forKey:key];
	}
	
	[self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	for (UITouch *touch in touches) {
		NSValue *key	= [NSValue valueWithNonretainedObject:touch];
		((Line *) self.currentLines[key]).end	= [touch locationInView:self];
	}
	[self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		NSValue *key	= [NSValue valueWithNonretainedObject:touch];
		CGPoint location	= [touch locationInView:self];
		if (self.finishedLines == nil) {
			self.finishedLines	= [[NSMutableArray alloc] init];
		}
		
		Line *line	= self.currentLines[key];
		if (line) {
			line.end	= location;
			[self.finishedLines addObject:line];
			[self.currentLines removeObjectForKey:key];
		}
	}

	[self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self.currentLines removeAllObjects];
	[self setNeedsDisplay];
}
@end
