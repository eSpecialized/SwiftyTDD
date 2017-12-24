
# Xcode 9.2, iOS 11.2 brought some changes to Swift 4 and XCUITest.

iOS Version : 11.2
Xcode Version : 9.2
Swift Version : 4.0

tasks covered in this sample project;
- Accessing Labels by its current string staticTexts[""]
- Accessing elements by their accessibility identifier
- Getting the value of the current label/item depends on the element kind.


## Accessibility identifier: Use it for grabbing access to the label.
      - Otherwise you must access it by the current staticText on the label,
      - Don't: set the Accessibility Hint, or Accessibility Label as that can mess up a test result on the labels new value.
       
## Use the new waitForExistance.
Setup the XCUIElement for labels, cells, etc. Then waitForExistance, do not do the exist == 1 testing like a year or two ago.
    
## How long does it take to write tests?
It appears some elements can take time to get right the first time, up to 30 minutes per test.

    
    
