# HLPlaceholder

HLPlaceholder provides an easy-to-use placeholder mechanism for textfields with a nice and smooth animation.

![HLPlaceholder Sample](https://raw.githubusercontent.com/fiftydegrees/HLPlaceholder/master/README-Files/hlplaceholder-sample1.gif)

## Installation

_**If your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `HLPlaceholder.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `./HLPlaceholder` folder into your project.

If you feel easy with Git, create a submodule into your own project.

## Usage

### Configuration

### Usage with storyboard

Drag-n-drop a classic UITextField and make it a subclass of HLPlaceholder.

### Usage with code

Create an instance of HLPlaceholder as you would have done with a classic UITextField -- in fact, HLPlaceholder is a subclass of UITextField.

### Customization

You can set the placeholder thumbnail color with the property `placeholderColor`:

```
sampleTextField.placeholderColor = [UIColor orangeColor];
```

## Credits

HLPlaceholder was developed by [Hervé Heurtault de Lammerville](http://www.hervedroit.com). If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLPlaceholder/issues/new) on GitHub. If you're using HLPlaceholder in your project, please let me know.