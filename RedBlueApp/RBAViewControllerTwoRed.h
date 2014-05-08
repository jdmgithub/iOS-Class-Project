//
//  RBAViewControllerTwoRed.h
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>



//
//@class MyClass;             //define class, so protocol can see MyClass
//@protocol MyClassDelegate <NSObject>   //define delegate protocol
//- (void) myClassDelegateMethod: (MyClass *) sender;  //define delegate method to be implemented within another class
//@end //end protocol
//
//
//@interface MyClass : NSObject {
//}
//@property (nonatomic, weak) id <MyClassDelegate> delegate; //define MyClassDelegate as delegate
//
//@end


@protocol VCTwoRedScoreDelegate;

@interface RBAViewControllerTwoRed : UIViewController

@property (nonatomic, assign)id<VCTwoRedScoreDelegate>delegate;


@end

@protocol VCTwoRedScoreDelegate <NSObject>


-(void)redTeamScores;
-(void)blueTeamScores;

@end




