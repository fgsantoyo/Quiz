//
//  FGQuizViewController.m
//  Quiz
//
//  Created by Fernando Garcia, Jr on 6/18/14.
//  Copyright (c) 2014 Fernando Garcia, Jr. All rights reserved.
//

#import "FGQuizViewController.h"

@interface FGQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation FGQuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.questions = @[@"From what cognac is made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.questionLabel.text = [self.questions objectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    //Step to the next question
    self.currentQuestionIndex++;
    
    //Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *currentQuestion = [self.questions objectAtIndex:self.currentQuestionIndex];
    
    self.questionLabel.text = currentQuestion;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    //What is the answer to the current question
    NSString *answer = [self.answers objectAtIndex:self.currentQuestionIndex];
    
    //Display it in the answer label
    self.answerLabel.text = answer;
}

@end
