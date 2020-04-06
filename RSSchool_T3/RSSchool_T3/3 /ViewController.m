


#import "ViewController.h"


@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UITextField* textFieldRed;
@property (strong, nonatomic) UITextField* textFieldGreen;
@property (strong, nonatomic) UITextField* textFieldBlue;

@property (strong, nonatomic) UILabel* labelResultColor;
@property (strong, nonatomic) UILabel* labelRed;
@property (strong, nonatomic) UILabel* labelGreen;
@property (strong, nonatomic) UILabel* labelBlue;

@property (strong, nonatomic) UIButton* buttonProcess;
@property (strong, nonatomic) UIView* viewResultColor;

@end


@implementation ViewController

static int const lableWidth = 100;
static int const lableHeight = 40;
static int const textFieldWidth = 200;
static int const textFieldHeight = 40;
static int const distanceX = 40;
static int const distanceBetweenViews = 100;



#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityIdentifier = @"mainView";
    self.view.backgroundColor =[UIColor whiteColor];
    [self setupSubviews];
}


- (void)setupSubviews {
    
    self.labelResultColor = [[UILabel alloc]initWithFrame:CGRectMake(distanceX, distanceBetweenViews, lableWidth, lableHeight)];
    [self setupLabel:self.labelResultColor Named:@"labelResultColor" Labeled:@"Color"];
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake((distanceX+lableWidth+distanceX),distanceBetweenViews ,100 , lableHeight)];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.viewResultColor.backgroundColor = UIColor.clearColor;
    [self.view addSubview:self.viewResultColor];
    
    self.labelRed = [[UILabel alloc]initWithFrame:CGRectMake(distanceX, (distanceBetweenViews+lableHeight+distanceBetweenViews), lableWidth, lableHeight)];
    [self setupLabel:self.labelRed Named:@"labelRed" Labeled:@"RED"];
    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake((distanceX+lableWidth+distanceX), (distanceBetweenViews+lableHeight+distanceBetweenViews), textFieldWidth, textFieldHeight)];
    [self setupTextField: self.textFieldRed Named:@"textFieldRed"];
    
    self.labelGreen = [[UILabel alloc]initWithFrame:CGRectMake(distanceX,(distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews) , lableWidth, lableHeight)];
    [self setupLabel:self.labelGreen Named:@"labelGreen" Labeled:@"GREEN"];
    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake((distanceX+lableWidth+distanceX),(distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews) , textFieldWidth, textFieldHeight)];
    [self setupTextField:self.textFieldGreen Named:@"textFieldGreen"];
    
    self.labelBlue = [[UILabel alloc]initWithFrame:CGRectMake(distanceX, (distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews), lableWidth, lableHeight)];
    [self setupLabel:self.labelBlue Named:@"labelBlue" Labeled:@"BLUE"];
    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake((distanceX+lableWidth+distanceX), (distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews), textFieldWidth, textFieldHeight)];
    [self setupTextField:self.textFieldBlue Named:@"textFieldBlue"];
    
    
    self.buttonProcess = [[UIButton alloc]initWithFrame:CGRectMake((self.view.center.x)-25, (distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews+lableHeight+distanceBetweenViews)+150, 50, 20)];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.buttonProcess.backgroundColor = [UIColor clearColor];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess sizeToFit];
    [self.buttonProcess addTarget:self action:@selector(buttonProcessDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
    
}

- (void)setupLabel:(UILabel *)label Named:(NSString *)identifier Labeled:(NSString *)text {
    label.accessibilityIdentifier = identifier;
    [label setText:text];
    [self.view addSubview:label];
}

- (void)setupTextField:(UITextField *)textField Named:(NSString *)identifier{
    textField.accessibilityIdentifier = identifier;
    textField.delegate = self;
    textField.placeholder = @"0..255";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
}

- (void)buttonProcessDidTap:(UIButton *)button {
    NSLog(@"Process...");
    [self.view endEditing:YES];
    [self processColor];
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
}
- (void)processColor {
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *characterSetFromRedTextField = [NSCharacterSet characterSetWithCharactersInString:self.textFieldRed.text];
    NSCharacterSet *characterSetFromGreenTextField = [NSCharacterSet characterSetWithCharactersInString:self.textFieldGreen.text];
    NSCharacterSet *characterSetFromBlueTextField = [NSCharacterSet characterSetWithCharactersInString:self.textFieldBlue.text];
    
    BOOL RedIsValid = [numbersOnly isSupersetOfSet:characterSetFromRedTextField] && (self.textFieldRed.text.length > 0);
    BOOL GreenIsValid = [numbersOnly isSupersetOfSet:characterSetFromGreenTextField] && (self.textFieldGreen.text.length > 0);
    BOOL BlueIsValid = [numbersOnly isSupersetOfSet:characterSetFromBlueTextField] && (self.textFieldBlue.text.length > 0);
    
    if (RedIsValid && GreenIsValid && BlueIsValid) {
        int redPart = [self.textFieldRed.text intValue];
        int greenPart = [self.textFieldGreen.text intValue];
        int bluePart = [self.textFieldBlue.text intValue];
        
        if ((redPart >= 0) && (redPart <= 255) &&
            (greenPart >= 0) && (greenPart <= 255) &&
            (bluePart >= 0) && (bluePart <= 255)
            )
        {
            UIColor* color = [UIColor colorWithRed:(redPart/255.0) green:(greenPart/255.0) blue:(bluePart/255.0) alpha:1];
            self.viewResultColor.backgroundColor = color;
            NSString * hexString = [NSString stringWithFormat:@"0x%02X%02X%02X", redPart, greenPart, bluePart];
            [self.labelResultColor setText:hexString];
        } else {
            [self.labelResultColor setText:@"Error"];
            self.viewResultColor.backgroundColor = UIColor.clearColor;
        }
    } else {
        [self.labelResultColor setText:@"Error"];
        self.viewResultColor.backgroundColor = UIColor.clearColor;
    }
}


@end
