# TTLog
Supplements to the output of `print` function with date+file+line+function and log type.


# Installation
Download and drag the file `TTLog.swift` to your Xcode project.

# Usage
code like this: 
```
TTLog.verbose(" This a verbose message!!!")
TTLog.info("Some infomation to show!")
TTLog.warning("These issues we must not overlook!!")
TTLog.debug("We meet the bug here!!")
TTLog.error("Here is an error!!!")
```
and console outputs: 
```
[2018-04-05 23:53:36.469] ViewController.swift:18 viewDidLoad() ❌ERROR: Here is an error!!!
[2018-04-05 23:53:36.469] ViewController.swift:20 viewDidLoad() ⚠️WARNING: These issues we must not overlook!!
[2018-04-05 23:53:36.469] ViewController.swift:17 viewDidLoad() 👻DEBUG: We meet the bug here!
[2018-04-05 23:53:36.469] ViewController.swift:19 viewDidLoad() ℹ️INFO: Some infomation to show!
[2018-04-05 23:53:36.469] ViewController.swift:16 viewDidLoad() 📣VERBOSE:  This a verbose message!!!
```

# Customization
You can easily modify `TTLog.swift` easily to create your own `print` func.

# License
MIT License, see the LICENSE file for more infomation.


