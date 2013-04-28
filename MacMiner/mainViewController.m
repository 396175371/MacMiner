//
//  mainViewController.m
//  MacMiner
//
//  Created by Administrator on 02/04/2013.
//  Copyright (c) 2013 fabulouspanda. All rights reserved.
//

#import "mainViewController.h"
#import "AppDelegate.h"
#import "NSFileManager+DirectoryLocations.h"

@interface mainViewController ()

@end

@implementation mainViewController

@synthesize mainView, poolView, userView, passView, optionsView, vectorView, outputView, startButton, statLabel, popoverTriggerButton, popover, rememberButton;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:(NSCoder *)aDecoder];
    if (self) {
        // Initialization code here.
//            NSLog(@"startup");
//        AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
        
        poolView.delegate = self;
        userView.delegate = self;
        passView.delegate = self;
        optionsView.delegate = self;

        outputView.delegate = self;
        statLabel.delegate = self;
        
/*

        

        
NSString *path = [[NSFileManager defaultManager] applicationSupportDirectory];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *pathopencl = [path stringByAppendingString:@"pyopencl"];
                NSString *pipPath = @"/usr/local/bin/pip";

        if ([fileManager fileExistsAtPath:pipPath]){
            NSLog(@"pip is installed");
            NSAlert *pipAlert = [[NSAlert alloc] init];
            [pipAlert addButtonWithTitle:@"Install"];
                        [pipAlert addButtonWithTitle:@"Quit"];
            [pipAlert setMessageText:@"python pip module is missing"];
            [pipAlert setInformativeText:@"This app requires python pip. Click 'Install' and you will be asked your password so it can be installed, or click 'Quit' and install pip yourself before relaunching this app."];

//            [[NSAlert init] alertWithMessageText:@"This app requires python pip. Click 'Install' and you will be asked your password so it can be installed, or click 'Quit' and install pip yourself before relaunching this app." defaultButton:@"Install" alternateButton:@"Quit" otherButton:nil informativeTextWithFormat:nil];
            //            NSAlertDefaultReturn = [self performSelector:@selector(installPip:)];
            [pipAlert setAlertStyle:NSWarningAlertStyle];
            //        returnCode: (NSInteger)returnCode
            [pipAlert beginSheetModalForWindow:[appDelegate window] modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
        }
        else {

        }
        
        if ([fileManager fileExistsAtPath:pathopencl]){
            NSLog(@"pyopencl is installed");
        }
        
//        NSLog(path);

 //   [self performSelector:@selector(launchstart:) withObject:nil afterDelay:0.0];
//        [self performSelector:@selector(launchCheck:) withObject:nil afterDelay:0.0];
        


    */
        
    }

    
 
    return self;
}
/*
- (void)alertDidEnd:(NSAlert *)pipAlert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    if (returnCode == NSAlertFirstButtonReturn) {
        NSLog(@"install pip");
    }
    if (returnCode == NSAlertSecondButtonReturn) {
        NSLog(@"quit");
    }
}
*/

- (BOOL)buttonIsPressed
{
    return self.popoverTriggerButton.intValue == 1;
}

- (IBAction)togglePopover:(id)sender
{
    if (self.buttonIsPressed) {
        [self.popover showRelativeToRect:[popoverTriggerButton bounds]
                                  ofView:popoverTriggerButton
                           preferredEdge:NSMaxYEdge];
    } else {
        [self.popover close];
    }
}


- (void)launchCheck:(id)sender
{


        // If the task is still sitting around from the last run, release it
        if (searchTask!=nil) {
            searchTask = nil;
        }
        // Let's allocate memory for and initialize a new TaskWrapper object, passing
        // in ourselves as the controller for this TaskWrapper object, the path
        // to the command-line tool, and the contents of the text field that
        // displays what the user wants to search on
        //        NSString *userplus = [userView.stringValue stringByAppendingString:@":"];
        //        NSString *userpass = [userplus stringByAppendingString:passView.stringValue];
        //        NSString *userpassplus = [userpass stringByAppendingString:@"@"];
        //        NSString *finalNecessities = [userpassplus stringByAppendingString:poolView.stringValue];
        
        searchTask=[[TaskWrapper alloc] initWithController:self arguments:[NSArray arrayWithObjects:@"/usr/local/bin/pip", @"/", @"--version", nil]];
        // kick off the process asynchronously
        //        [searchTask setLaunchPath: @"/sbin/ping"];
        [searchTask startProcess];    
}




- (void)launchstart:(id)sender
{
    if (findRunning)
    {
        // change the button's title back for the next search
        [startButton setTitle:@"Start"];
        // This stops the task and calls our callback (-processFinished)
        [searchTask stopProcess];
        // Release the memory for this wrapper object
        findRunning=NO;

        searchTask=nil;
        return;
    }
    else
    {
            [startButton setTitle:@"Stop"];
        // If the task is still sitting around from the last run, release it
        if (searchTask!=nil) {
            searchTask = nil;
        }
        // Let's allocate memory for and initialize a new TaskWrapper object, passing
        // in ourselves as the controller for this TaskWrapper object, the path
        // to the command-line tool, and the contents of the text field that
        // displays what the user wants to search on
//        NSString *userplus = [userView.stringValue stringByAppendingString:@":"];
//        NSString *userpass = [userplus stringByAppendingString:passView.stringValue];
//        NSString *userpassplus = [userpass stringByAppendingString:@"@"];
//        NSString *finalNecessities = [userpassplus stringByAppendingString:poolView.stringValue];

        searchTask=[[TaskWrapper alloc] initWithController:self arguments:[NSArray arrayWithObjects:@"/usr/bin/python", @"/Users/admin/Desktop/1bit/poclbm-master/", @"poclbm.py", @"user.worker:pass@stratum.bitcoin.cz:3333", nil]];
        // kick off the process asynchronously
        //        [searchTask setLaunchPath: @"/sbin/ping"];
        [searchTask startProcess];    }
}

- (IBAction)start:(id)sender
{
    if (findRunning)
    {
        // change the button's title back for the next search
        [startButton setTitle:@"Start"];
        // This stops the task and calls our callback (-processFinished)
        [searchTask stopProcess];
        findRunning=NO;

        // Release the memory for this wrapper object
        
        searchTask=nil;
        return;
    }
    else
    {
            [startButton setTitle:@"Stop"];
        // If the task is still sitting around from the last run, release it
        if (searchTask!=nil) {
            searchTask = nil;
        }
        // Let's allocate memory for and initialize a new TaskWrapper object, passing
        // in ourselves as the controller for this TaskWrapper object, the path
        // to the command-line tool, and the contents of the text field that
        // displays what the user wants to search on
        
//        AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
        
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs synchronize];
        // getting an NSString
        NSString *minerString = [prefs stringForKey:@"whichMiner"];
        
        if ([minerString isEqual: @"bfgminer"]) {
            NSString *oString = @"-o";
            NSString *poolString = [oString stringByAppendingString:poolView.stringValue];
            NSString *uString = @"-u";
            NSString *userString = [uString stringByAppendingString:userView.stringValue];
            NSString *pString = @"-p";
            NSString *passString = [pString stringByAppendingString:passView.stringValue];
            
            NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
            NSString *poclbmPath = [bundlePath stringByDeletingLastPathComponent];
            
            if (optionsView.stringValue == nil) {
            [optionsView setStringValue:@"-q"];
            }
            NSString *optionsString = optionsView.stringValue;
            
            
            
            
            
            poclbmPath = [poclbmPath stringByAppendingString:@"/Resources/bfgminer/bin/bfgminer"];
        NSString *launchPath = @"/Applications/MacMiner.app/Contents/Resources/bfgminer/bin/bfgminer";
        NSString *bfgPath = @"/Applications/MacMiner.app/Contents/Resources/bfgminer/bin/bfgminer";
            //        NSLog(poclbmPath);
            [self.outputView setString:@""];
            NSString *startingText = @"Starting…";
            self.statLabel.stringValue = startingText;
            //            self.outputView.string = [self.outputView.string stringByAppendingString:poclbmPath];
            //            self.outputView.string = [self.outputView.string stringByAppendingString:finalNecessities];
            searchTask=[[TaskWrapper alloc] initWithController:self arguments:[NSArray arrayWithObjects:launchPath, bfgPath, optionsString, poolString, userString, passString, nil]];
            // kick off the process asynchronously
            //        [searchTask setLaunchPath: @"/sbin/ping"];
            [searchTask startProcess];
            
            
            if (rememberButton.state == NSOnState) {
                
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                
                // saving an NSString
                [prefs setObject:userView.stringValue forKey:@"userValue"];
                [prefs setObject:passView.stringValue forKey:@"passValue"];
                [prefs setObject:poolView.stringValue forKey:@"poolValue"];
                [prefs setObject:optionsView.stringValue forKey:@"optionsValue"];
                
                // This is suggested to synch prefs, but is not needed (I didn't put it in my tut)
                [prefs synchronize];
            }
            
            
        }
        
        else {
        
        
        NSString *userplus = [userView.stringValue stringByAppendingString:@":"];
        NSString *userpass = [userplus stringByAppendingString:passView.stringValue];
        NSString *userpassplus = [userpass stringByAppendingString:@"@"];
        NSString *finalNecessities = [userpassplus stringByAppendingString:poolView.stringValue];
        
        NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
        NSString *poclbmPath = [bundlePath stringByDeletingLastPathComponent];
        NSString *optionsString = optionsView.stringValue;
        poclbmPath = [poclbmPath stringByAppendingString:@"/Resources/poclbm.app/Contents/MacOS/poclbm"];
//        NSLog(poclbmPath);
            [self.outputView setString:@""];
        NSString *startingText = @"Starting…";
            self.statLabel.stringValue = startingText;
//            self.outputView.string = [self.outputView.string stringByAppendingString:poclbmPath];
//            self.outputView.string = [self.outputView.string stringByAppendingString:finalNecessities];
        searchTask=[[TaskWrapper alloc] initWithController:self arguments:[NSArray arrayWithObjects:poclbmPath, poclbmPath, optionsString, finalNecessities, nil]];
        // kick off the process asynchronously
        //        [searchTask setLaunchPath: @"/sbin/ping"];
        [searchTask startProcess];
        
        
        if (rememberButton.state == NSOnState) {
            
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:userView.stringValue forKey:@"userValue"];
        [prefs setObject:passView.stringValue forKey:@"passValue"];
        [prefs setObject:poolView.stringValue forKey:@"poolValue"];
        [prefs setObject:optionsView.stringValue forKey:@"optionsValue"];
        
        // This is suggested to synch prefs, but is not needed (I didn't put it in my tut)
        [prefs synchronize];
        }
        
        
    }
  
  }
  
}

// This callback is implemented as part of conforming to the ProcessController protocol.
// It will be called whenever there is output from the TaskWrapper.
- (void)appendOutput:(NSString *)output
{
    NSString *bfgOutput = @"5s:";
    if ([output rangeOfString:bfgOutput].location != NSNotFound) {

        // Substring found...
        self.statLabel.stringValue = output;
    }
    else {
    
    NSString *poolString = @"MH/s)] [Rej:";
    NSRange result = [output rangeOfString:poolString];
    if (result.length >0){
output = [[output componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
        NSMutableCharacterSet *_space = [NSMutableCharacterSet characterSetWithCharactersInString:@" "];
        output = [output stringByTrimmingCharactersInSet:_space];
        output = [output stringByReplacingOccurrencesOfString:poolView.stringValue withString:@""];
        self.statLabel.stringValue = output;
    }
    else
//    AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    // add the string (a chunk of the results from locate) to the NSTextView's
    // backing store, in the form of an attributed string
    self.outputView.string = [self.outputView.string stringByAppendingString:output];
    
    /*    [[appDelegate.pingReport textStorage] appendAttributedString: [[NSAttributedString alloc]
     initWithString: output]];
     */
    
    // setup a selector to be called the next time through the event loop to scroll
    // the view to the just pasted text.  We don't want to scroll right now,
    // because of a bug in Mac OS X version 10.1 that causes scrolling in the context
    // of a text storage update to starve the app of events
    [self performSelector:@selector(scrollToVisible:) withObject:nil afterDelay:0.0];
}
}

// This routine is called after adding new results to the text view's backing store.
// We now need to scroll the NSScrollView in which the NSTextView sits to the part
// that we just added at the end
- (void)scrollToVisible:(id)ignore {
 //   AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    [self.outputView scrollRangeToVisible:NSMakeRange([[self.outputView string] length], 0)];
}

// A callback that gets called when a TaskWrapper is launched, allowing us to do any setup
// that is needed from the app side.  This method is implemented as a part of conforming
// to the ProcessController protocol.
- (void)processStarted
{
//    AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    findRunning=YES;
    // clear the results
//    [self.outputView setString:@""];
    // change the "Sleuth" button to say "Stop"
    [startButton setTitle:@"Stop"];
}

// A callback that gets called when a TaskWrapper is completed, allowing us to do any cleanup
// that is needed from the app side.  This method is implemented as a part of conforming
// to the ProcessController protocol.
- (void)processFinished
{
    findRunning=NO;
    // change the button's title back for the next search
    [startButton setTitle:@"Start"];
}

// If the user closes the search window, let's just quit
-(BOOL)windowShouldClose:(id)sender
{
    [NSApp terminate:nil];
    return YES;
}

// Display the release notes, as chosen from the menu item in the Help menu.
- (IBAction)displayReleaseNotes:(id)sender
{
    // Grab the release notes from the Resources folder in the app bundle, and stuff
    // them into the proper text field
 //   [relNotesTextField readRTFDFromFile:[[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"]];
   // [relNotesWin makeKeyAndOrderFront:self];
}

// when first launched, this routine is called when all objects are created
// and initialized.  It's a chance for us to set things up before the user gets
// control of the UI.
-(void)awakeFromNib
{
    findRunning=NO;
    searchTask=nil;
    // Lets make sure that there is something valid in the locate database; otherwise,
    // all searches will come back empty.
    /*
     if ([self ensureLocateDBExists]==NO)
     {
     // Explain to the user that they need to go update the database as root.
     // That is, if they want locate to be able to really find *any* file
     // on their hard drive (perhaps not great for security, but good for usability).
     NSRunAlertPanel(@"Error",@"Sorry, Moriarity's 'locate' database is missing or empty.  In a terminal, as root run '/usr/libexec/locate.updatedb' and try Moriarity again.", @"OK",NULL,NULL);
     [NSApp terminate:nil];
     }*/
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    NSString *poolString = [prefs stringForKey:@"poolValue"];
    NSString *userString = [prefs stringForKey:@"userValue"];
    NSString *passString = [prefs stringForKey:@"passValue"];
    NSString *optionsString = [prefs stringForKey:@"optionsValue"];

    if (poolString != nil) {
    [poolView setStringValue:poolString];
    }
    if (userString != nil) {
    [userView setStringValue:userString];
    }
    if (passString != nil) {
    [passView setStringValue:passString];
    }
    if (optionsString != nil) {
    [optionsView setStringValue:optionsString];
    }
}


@end
