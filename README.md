# Swift Color Picker
Color picker build with Swift 3, iOS 10, Xcode 8.

## Overview
The color picker view controller created with swift. It can be used to pick color from palette either as Hex string or UIColor.  Just add source file within any swift project, add view controller within storyboard, add collection view, set necessary properrty and constrains, and invoke as a popup. Once color picked it returns selected color value within delegate method.

![ScreenShot iPhone5](../master/Screenshots/main-1t.png)
![ScreenShot iPhone5](../master/Screenshots/main-2t.png)

## Features:
+ Can be invoked by UIButton.
+ Can be invoked by navigation bar button.
+ You can Add more colors to palette via Colors.plist file.
+ Build with Swift 3, iOS 10, Xcode 8 only, No other dependency.

## Platform
+ Swift 3
+ iOS 10
+ Xcode 8

##Supported Devices
iPhone 4s, 5, 5s, 5c, 6, 6 Plus, 6s, 6s Plus, all iPads having iOS 10.

## How To Setup Color Picker Within Your Project

###### 1 - Copy ``ColorPickerViewController.swift`` and ``Colors.plist`` into your project.

###### 2 - Setup ColorPickerViewController within a Storyboard.
+ **Add View Controller within Storyboard**
+ set Class ``ColorPickerViewController``
+ set Storyboard ID ``sbColorPicker``
+ within 'Attribute Inspector' set Similated metrics >> Size``Freeform``
+ Within 'Size inspector' set Width ``273``, Height ``431``
+
+ **Add Collection View within view controller**
+ set collection view background color white.
+ set collection view cell identfier ``ColorCell``
+ uncheck ``Shows Horizonral Indicator``
+ uncheck ``Shows Vertical Indicator``
+ set Cell Size, Width ``24`` Height ``24``
+ set Minimum Spacing, For Cells ``1``, For Lines ``1``
+ set View  X ``8``, Y ``8``, Width ``257``, Height ``415``
+
+ **Set collection view contraints**
+ Leading Space ``8``, Trailing Space ``8``, Top Space ``8``, Bottom Space ``8``
+
+ **Set collection view outlet within ``ColorPickerViewController.swift``**
+ i.e. connect collection view with ``@IBOutlet var colorCollectionView : UICollectionView!``

###### 3 - Now you can use color picker from any view controller.
Please refer 'How To Use' section for more details.

## How To Update Color Palette
- Open ``Colors.plist`` file,  
- add/update color hex value.
- e.g. ``<string>002133</string>``

## How To Use
You can use color picker from any view controller.

**Set delegate to class**
<pre>
 class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, ColorPickerDelegate { .. }
</pre>

**Add popover delegate function**
<pre>
// MARK: Popover delegate functions
// Override iPhone behavior that presents a popover as fullscreen.
// i.e. now it shows same popover box within on iPhone & iPad
func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
  // show popover box for iPhone and iPad both
  return UIModalPresentationStyle.None
}
</pre>

**Add color picker delegate function.** This function will be called after color picked, you can add custom code to handle the selected color. i.e you can assign selected color to class variable or change background color of any element etc.
<pre>
// MARK: Color picker delegate functions
// called by color picker after color selected.
func colorPickerDidColorSelected(#selectedUIColor: UIColor, selectedHexColor: String) {

  // update color value within class variable
  self.selectedColor = selectedUIColor
  self.selectedColorHex = selectedHexColor

  // set preview background to selected color
  self.colorPreview.backgroundColor = selectedUIColor
}
</pre>

**Add utility function to show color picker from UI Button.**
<pre>
// MARK: - Utility functions
// show color picker from UIButton
private func showColorPicker(){

    // initialise color picker view controller
    let colorPickerVc = storyboard?.instantiateViewControllerWithIdentifier("sbColorPicker") as! ColorPickerViewController

    // set modal presentation style
    colorPickerVc.modalPresentationStyle = .Popover

    // set max. size
    colorPickerVc.preferredContentSize = CGSizeMake(265, 400)

    // set color picker deleagate to current view controller
    // must write delegate method to handle selected color
    colorPickerVc.colorPickerDelegate = self

    // show popover
    if let popoverController = colorPickerVc.popoverPresentationController {

        // set source view
        popoverController.sourceView = self.view

        // show popover form button
        popoverController.sourceRect = self.changeColorButton.frame

        // show popover arrow at feasible direction
        popoverController.permittedArrowDirections = UIPopoverArrowDirection.Any

        // set popover delegate self
        popoverController.delegate = self
    }

    //show color popover
    presentViewController(colorPickerVc, animated: true, completion: nil)
}
</pre>

**Set Outlet and Action for UI Button** and call self.showColorPicker() from it.
<pre>
// outlet - change color button
@IBOutlet var changeColorButton: UIButton!

// action - called when change color button clicked
@IBAction func changeColorButtonClicked(sender: UIButton) {
  self.showColorPicker()
}
</pre>


## Screenshots

**iPhone 4S**

![ScreenShot iPhone4s](../master/Screenshots/iphone4s-1t.png)
![ScreenShot iPhone4S](../master/Screenshots/iphone4s-2t.png)

**iPhone 5**

![ScreenShot iPhone5](../master/Screenshots/main-1t.png)
![ScreenShot iPhone5](../master/Screenshots/main-2t.png)

**iPhone 6**

![ScreenShot iPhone6](../master/Screenshots/iphone6-1t.png)
![ScreenShot iPhone6](../master/Screenshots/iphone6-2t.png)

**iPad**

![ScreenShot iPhone6](../master/Screenshots/ipad-1t.png)
![ScreenShot iPhone6](../master/Screenshots/ipad-2t.png)


## License
SwiftColorPicker is available under the MIT license. See the LICENSE file for more info.

## Legacy Version
Xcode 6, iOS 8.4 based source code moved to ``Source-Xcode6`` folder. Please note that Xcode 6 based source code are deprecated and not upto date. I will suggest to use latest Xcode 8 based source from``SwiftColorPicker`` folder at root.
