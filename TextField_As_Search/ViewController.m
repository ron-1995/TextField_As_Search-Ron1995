//
//  ViewController.m
//  TextField_As_Search
//
//  Created by ronakj on 8/8/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *ArrCountryName , *ArrName ;
    NSArray *searchArray;
    NSString *colorString;
     NSMutableAttributedString *strTextForColor;
    BOOL isSearchingNow,isF_textfield , isBackSpacePressed;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isBackSpacePressed=false;
    self.view_out.hidden = YES;
    strTextForColor = [NSMutableAttributedString new];
    
  
    
    ArrCountryName = [[NSMutableArray alloc]initWithObjects:@"Afghanistan (+93)",@"Albania (+355)",@"Algeria (+213)",@"American Samoa (+1 684)",@"Andorra (+376)",@"Angola (+244)",@"Anguilla (+1 264)",@"Antarctica (+672)",@"Antigua and Barbuda (+1 268)",@"Argentina (+54)",@"Armenia (+374)",@"Aruba (+297)",@"Australia (+61)",@"Austria (+43)",@"Azerbaijan (+994)",@"Bahamas (+1 242)",@"Bahrain (+973)",@"Bangladesh (+880)",@"Barbados (+1 246)",@"Belarus (+375)",@"Belgium (+32)",@"Belize (+501)",@"Benin (+229)",@"Bermuda (+1 441)",@"Bhutan (+975)",@"Bolivia (+591)",@"Bosnia and Herzegovina (+387)",@"Botswana (+267)",@"Brazil (+55)",@"British Indian Ocean Territory (+)",@"British Virgin Islands (+1 284)",@"Brunei (+673)",@"Bulgaria (+359)",@"Burkina Faso (+226)",@"Burma (Myanmar) (+95)",@"Burundi (+257)",@"Cambodia (+855)",@"Cameroon (+237)",@"Canada (+1)",@"Cape Verde (+238)",@"Cayman Islands (+1 345)",@"Central African Republic (+236)",@"Chad (+235)",@"Chile (+56)",@"China (+86)",@"Christmas Island (+61)",@"Cocos (Keeling) Islands (+61)",@"Colombia (+57)",@"Comoros (+269)",@"Cook Islands (+682)",@"Costa Rica (+506)",@"Croatia (+385)",@"Cuba (+53)",@"Cyprus (+357)",@"Czech Republic (+420)",@"Democratic Republic of the Congo (+243)",@"Denmark (+45)",@"Djibouti (+253)",@"Dominica (+1 767)",@"Dominican Republic (+1 809)",@"Ecuador (+593)",@"Egypt (+20)",@"El Salvador (+503)",@"Equatorial Guinea (+240)",@"Eritrea (+291)",@"Estonia (+372)",@"Ethiopia (+251)",@"Falkland Islands (+500)",@"Faroe Islands (+298)",@"Fiji (+679)",@"Finland (+358)",@"France (+33)",@"French Polynesia (+689)",@"Gabon (+241)",@"Gambia (+220)",@"Gaza Strip (+970)",@"Georgia (+995)",@"Germany (+49)",@"Ghana (+233)",@"Gibraltar (+350)",@"Greece (+30)",@"Greenland (+299)",@"Grenada (+1 473)",@"Guam (+1 671)",@"Guatemala (+502)",@"Guinea (+224)",@"Guinea-Bissau (+245)",@"Guyana (+592)",@"Haiti (+509)",@"Holy See (Vatican City) (+39)",@"Honduras (+504)",@"Hong Kong (+852)",@"Hungary (+36)",@"Iceland (+354)",@"India (+91)",@"Indonesia (+62)",@"Iran (+98)",@"Iraq (+964)",@"Ireland (+353)",@"Isle of Man (+44)",@"Israel (+972)",@"Italy (+39)",@"Ivory Coast (+225)",@"Jamaica (+1 876)",@"Japan (+81)",@"Jersey (+)",@"Jordan (+962)",@"Kazakhstan (+7)",@"Kenya (+254)",@"Kiribati (+686)",@"Kosovo (+381)",@"Kuwait (+965)",@"Kyrgyzstan (+996)",@"Laos (+856)",@"Latvia (+371)",@"Lebanon (+961)",@"Lesotho (+266)",@"Liberia (+231)",@"Libya (+218)",@"Liechtenstein (+423)",@"Lithuania (+370)",@"Luxembourg (+352)",@"Macau (+853)",@"Macedonia (+389)",@"Madagascar (+261)",@"Malawi (+265)",@"Malaysia (+60)",@"Maldives (+960)",@"Mali (+223)",@"Malta (+356)",@"Marshall Islands (+692)",@"Mauritania (+222)",@"Mauritius (+230)",@"Mayotte (+262)",@"Mexico (+52)",@"Micronesia (+691)",@"Moldova (+373)",@"Monaco (+377)",@"Mongolia (+976)",@"Montenegro (+382)",@"Montserrat (+1 664)",@"Morocco (+212)",@"Mozambique (+258)",@"Namibia (+264)",@"Nauru (+674)",@"Nepal (+977)",@"Netherlands (+31)",@"Netherlands Antilles (+599)",@"New Caledonia (+687)",@"New Zealand (+64)",@"Nicaragua (+505)",@"Niger (+227)",@"Nigeria (+234)",@"Niue (+683)",@"Norfolk Island (+672)",@"North Korea (+850)",@"Northern Mariana Islands (+1 670)",@"Norway (+47)",@"Oman (+968)",@"Pakistan (+92)",@"Palau (+680)",@"Panama (+507)",@"Papua New Guinea (+675)",@"Paraguay (+595)",@"Peru (+51)",@"Philippines (+63)",@"Pitcairn Islands (+870)",@"Poland (+48)",@"Portugal (+351)",@"Puerto Rico (+1)",@"Qatar (+974)",@"Republic of the Congo (+242)",@"Romania (+40)",@"Russia (+7)",@"Rwanda (+250)",@"Saint Barthelemy (+590)",@"Saint Helena (+290)",@"Saint Kitts and Nevis (+1 869)",@"Saint Lucia (+1 758)",@"Saint Martin (+1 599)",@"Saint Pierre and Miquelon (+508)",@"Saint Vincent and the Grenadines (+1 784)",@"Samoa (+685)",@"San Marino (+378)",@"Sao Tome and Principe (+239)",@"Saudi Arabia (+966)",@"Senegal (+221)",@"Serbia (+381)",@"Seychelles (+248)",@"Sierra Leone (+232)",@"Singapore (+65)",@"Slovakia (+421)",@"Slovenia (+386)",@"Solomon Islands (+677)",@"Somalia (+252)",@"South Africa (+27)",@"South Korea (+82)",@"Spain (+34)",@"Sri Lanka (+94)",@"Sudan (+249)",@"Suriname (+597)",@"Svalbard (+)",@"Swaziland (+268)",@"Sweden (+46)",@"Switzerland (+41)",@"Syria (+963)",@"Taiwan (+886)",@"Tajikistan (+992)",@"Tanzania (+255)",@"Thailand (+66)",@"Timor-Leste (+670)",@"Togo (+228)",@"Tokelau (+690)",@"Tonga (+676)",@"Trinidad and Tobago (+1 868)",@"Tunisia (+216)",@"Turkey (+90)",@"Turkmenistan (+993)",@"Turks and Caicos Islands (+1 649)",@"Tuvalu (+688)",@"Uganda (+256)",@"Ukraine (+380)",@"United Arab Emirates (+971)",@"United Kingdom (+44)",@"United States (+1)",@"Uruguay (+598)",@"US Virgin Islands (+1 340)",@"Uzbekistan (+998)",@"Vanuatu (+678)",@"Venezuela (+58)",@"Vietnam (+84)",@"Wallis and Futuna (+681)",@"West Bank (+970)",@"Western Sahara (+)",@"Yemen (+967)",@"Zambia (+260)",@"Zimbabwe (+263)",nil];

    

    
    ArrName = [[NSMutableArray alloc]initWithObjects:@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    
    
   
    self.txt_name.tag = 0;
    self.txt_con_name.tag = 1;
    
    self.txt_name.delegate =self;
    self.txt_con_name.delegate = self;
    
    self.tableview_out.delegate = self;
    self.tableview_out.dataSource = self;
    
    
    [self.tableview_out reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_can:(id)sender {
    
    self.txt_name.text = nil;
   [_tableview_out reloadData];
    self.view_out.hidden = YES;
  
}

- (IBAction)btn_cancel:(id)sender {
    self.txt_con_name.text = nil;
    
      [_tableview_out reloadData];
     self.view_out.hidden = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
      if(isSearchingNow)
            return searchArray.count;
        else
        {
            if (searchArray.count==0) {
                return 0;
            }
            else
            {
                if (isF_textfield) {
                    return ArrName.count;
                }
                else{
                    return ArrCountryName.count;
                }
                
            }
            
        }
       
   }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableview_out dequeueReusableCellWithIdentifier:CellIdentifier];
     cell.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.layer.backgroundColor = [UIColor whiteColor].CGColor;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.highlightedTextColor = [UIColor orangeColor];

 
        if(isSearchingNow)
        {
            cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];
            
            strTextForColor =  [self getAttributeText:cell.textLabel.text forSubstring:colorString];
            
            [cell.textLabel setAttributedText: strTextForColor];
            
            
        }
        else{
            if (isF_textfield) {
             cell.textLabel.text = [ArrName objectAtIndex:indexPath.row];            }
            else{
                cell.textLabel.text = [ArrCountryName objectAtIndex:indexPath.row];

            }
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *selectedcell=(UITableViewCell *)[self.tableview_out cellForRowAtIndexPath:indexPath];
    
    if (isF_textfield) {
        
        self.txt_name.text = selectedcell.textLabel.text;
        
    }
    else{
         self.txt_con_name.text = selectedcell.textLabel.text;
    }
    
    // self.view_out.layer.speed =1.0;
   // self.view_out.hidden = YES;
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor orangeColor];
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor blackColor];
    return indexPath;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(isBackSpacePressed)
        colorString = textField.text;
    
    return true;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
        self.view_out.hidden = NO;
        
    if([string isEqualToString:@""])
        isBackSpacePressed=true;
    else
        isBackSpacePressed=false;
    NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@"()   ;    ^^ ?? ? // [{]}+=_-* / ,' \\  \" ^#`<>| ^  % : @ @@"];
    NSString *str1 = [textField.text stringByTrimmingCharactersInSet:charsToTrim];
    NSMutableString *someString= [NSMutableString stringWithString:str1];
    [someString appendString: string];
    
    colorString = someString;
    NSString *strSearch1 = [someString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",strSearch1];
    
    
        NSArray *filteredArray;
    
    if (textField.tag == 0) {
        isF_textfield = TRUE;
        filteredArray= [ArrName filteredArrayUsingPredicate:resultPredicate];
    }
    else{
     isF_textfield = FALSE;
        filteredArray= [ArrCountryName filteredArrayUsingPredicate:resultPredicate];
    }
    
        
    
        
        searchArray = nil;
        searchArray = filteredArray;
        if(searchArray.count>0)
            isSearchingNow=true;
        else
            isSearchingNow=false;
        if (string.length == 0 && textField.text.length == 1)
        {
        
            [_tableview_out reloadData];
            self.view_out.hidden = YES;
        }
        [self.tableview_out reloadData];
        return TRUE;
    }
-(NSMutableAttributedString*)getAttributeText:(NSString*)string forSubstring:(NSString*)searchstring {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:string];
    
    
    NSRange searchRange = NSMakeRange(0,string.length);
    for (NSInteger charIdx=0; charIdx<searchstring.length; charIdx++){
        NSString *substring = [searchstring substringWithRange:NSMakeRange(charIdx, 1)];
        NSRange foundRange;
        searchRange.location = 0;
        while (searchRange.location < string.length) {
            searchRange.length = string.length-searchRange.location;
            foundRange = [string rangeOfString:substring options:1 range:searchRange];
            [text addAttribute: NSForegroundColorAttributeName value: [UIColor redColor] range:foundRange];
            if (foundRange.location != NSNotFound) {
                searchRange.location = foundRange.location+foundRange.length;
            } else {
                // no more substring to find
                break;
            }
        }
    }
    return text;
}

@end
