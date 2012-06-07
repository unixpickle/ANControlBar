ANControlBar
============

ANControlBar is an easy-to-use toolbar class which looks best under an NSTableView.  The appearance of ANControlBar mirrors the add/remove buttons in many native OS X applications, such as the Accounts System Preferences pane.

![ANControlBar](https://github.com/unixpickle/ANControlBar/raw/master/demo.png)

Usage
=====

Using ANControlBar is rather straightforward.  First, add the ANControlBar/ directory to your project, making sure to add it to the desired target.  Next, simple create an instance of ANControlBar using initWithFrame:, on with Interface Builder.  Finally, add buttons to it using the addButton: method.  See `ControlBar/AppDelegate.m` for more details.
