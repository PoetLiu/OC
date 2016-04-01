//
//  DrawView.m
//  TouchTracker
//
//  Created by liupeng on 16/3/31.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

-(BOOL)canBecomeFirstResponder {
	return YES;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
		doubleTapRecognizer.numberOfTapsRequired	= 2;
		doubleTapRecognizer.delaysTouchesBegan		= YES;
		[self addGestureRecognizer:doubleTapRecognizer];
		
		UITapGestureRecognizer *tapRecognizer		= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
		tapRecognizer.delaysTouchesBegan			= YES;
		[tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
		[self addGestureRecognizer:tapRecognizer];
		
		UILongPressGestureRecognizer *longRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
		[self addGestureRecognizer:longRecognizer];
		
		self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
		self.panRecognizer.cancelsTouchesInView	= NO;
		self.panRecognizer.delegate	= self;
		[self addGestureRecognizer:self.panRecognizer];
		
		self.currentLines	= [[NSMutableDictionary alloc] initWithCapacity:5];
		self.finishedLines	= [[NSMutableArray alloc] init];
		self.seletedIndex	= -1;
	}
	return self;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}

-(void)moveLine:(UIPanGestureRecognizer *)gestureRecognizer {
	NSLog(@"Recognized a pan");
	NSInteger index = self.seletedIndex;
	if (index != -1) {
		if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
			CGPoint translation = [gestureRecognizer translationInView:self];
		}
	}
}

-(void)longPress:(UIGestureRecognizer *)gestureRecognizer {
	NSLog(@"Recognized a longPress");
	if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
		CGPoint loation = [gestureRecognizer locationInView:self];
		self.seletedIndex = [self indexOfLineAtPoint:loation];
		if (self.seletedIndex != -1) {
			[self.currentLines removeAllObjects];
		}
	} else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
		self.seletedIndex	= -1;
	}
	[self setNeedsDisplay];
}

-(void)deleteLine {
	if (self.seletedIndex != -1) {
		[self.finishedLines removeObjectAtIndex:self.seletedIndex];
		[self setNeedsDisplay];
		self.seletedIndex	= -1;
	}
}

-(void)tap:(UIGestureRecognizer *)gestureRecognizer {
	NSLog(@"Recognized a tap");
	CGPoint location = [gestureRecognizer locationInView:self];
	self.seletedIndex	= [self indexOfLineAtPoint:location];
	UIMenuController *menu = [UIMenuController sharedMenuController];
	if (self.seletedIndex != -1) {
		[self becomeFirstResponder];
		UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"delete" action:@selector(deleteLine)];
		menu.menuItems	= [[NSArray alloc] initWithObjects:deleteItem, nil];
		[menu setTargetRect:CGRectMake(location.x, location.y, 2, 2) inView:self];
		[menu setMenuVisible:true animated:true];
	} else {
		[menu setMenuVisible:false animated:true];
	}
	[self setNeedsDisplay];
}

-(void)doubleTap:(UIGestureRecognizer *)gestureRecognizer {
	NSLog(@"Recognized a double tap");
	self.seletedIndex	= -1;
	[[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
	[self.currentLines removeAllObjects];
	[self.finishedLines removeAllObjects];
	[self setNeedsDisplay];
}

-(NSInteger)indexOfLineAtPoint:(CGPoint)point {
	for (Line *line in self.finishedLines) {
		CGPoint begin = line.begin;
		CGPoint end	= line.end;
		
		CGFloat t = 0.0f;
		for (; t < 1.0f; t += 0.05f) {
			CGFloat x = begin.x + ((end.x - begin.x)*t);
			CGFloat y = begin.y + ((end.y - begin.y)*t);
			if (hypot(x - point.x, y - point.y) < 20.0) {
				return [self.finishedLines indexOfObject:line];
			}
		}
	}
	return -1;
}

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
	
	if (self.seletedIndex != -1) {
		[[UIColor greenColor] setStroke];
		Line *line	= [self.finishedLines objectAtIndex:self.seletedIndex];
		[self strokeLine:line];
	}
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [touches allObjects]) {
		CGPoint location = [touch locationInView:self];
		Line *newLine	= [[Line alloc] initWithBegin:location end:location];
		NSValue *key	= [NSValue valueWithNonretainedObject:touch];
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
