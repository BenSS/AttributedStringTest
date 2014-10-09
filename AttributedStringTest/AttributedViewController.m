//
//  AttributedViewController.m
//  AttributedStringTest
//
//  Created by Benjamin Shive on 10/8/14.
//  Copyright (c) 2014 Philadelphia Code Works. All rights reserved.
//

#import "AttributedViewController.h"

@interface AttributedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;

@property (strong, nonatomic) NSDate *startTime;
@property (weak, nonatomic) IBOutlet UILabel *msLabel;

@end

@implementation AttributedViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	self.startTime = [NSDate date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	NSString *htmlString = @"<p>some html string:</p><p>The string contains a <b>bunch</b> of text that should run into multiple (2-5) lines and usually comes from a service.</p>";
	
	NSError *error;
	
	self.labelOne.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														 documentAttributes:nil
																	  error:&error];
	
	NSString *headerHTML = [NSString stringWithFormat:@"<html><meta charset='utf-8'><head><style type='text/css'>* { font-family: '%@'; font-size: %.0fpx; color: rgb(%d, %d, %d); } p {margin:0; padding:0;}</style></head><body>", @"Georgia", 17.0, (int)roundf(256*.9), (int)roundf(256*.9), (int)roundf(256*.9)];
	NSString *footerHTML = @"</body></html>";
	htmlString = [NSString stringWithFormat:@"%@\n%@\n%@", headerHTML, htmlString, footerHTML];
	
	self.labelTwo.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														 documentAttributes:nil
																	  error:&error];
	self.labelThree.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														   documentAttributes:nil
																		error:&error];
	self.labelFour.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														  documentAttributes:nil
																	   error:&error];
	
	/// Extra string loading to highlight the difference in execution between iOS8 and 7
	
	self.labelTwo.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														 documentAttributes:nil
																	  error:&error];
	self.labelThree.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														   documentAttributes:nil
																		error:&error];
	self.labelFour.attributedText = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
														  documentAttributes:nil
																	   error:&error];
}

- (void)viewDidAppear:(BOOL)animated {
	double timePassed_ms = [self.startTime timeIntervalSinceNow] * -1000.0;
	self.msLabel.text = [NSString stringWithFormat:@"%.0fms", timePassed_ms];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
