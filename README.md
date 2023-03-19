
This repository contains a template to use for starting a Skip project.

You can clone this repository directory to experiment with Skip,
or else use it as a template for a new Skip project of your own. 


## Testing from the CLI

Check out the reppository, such as by running the following commands from the command line:

```shell
git clone https://github.com/skiptools/skip-template.git
cd skip-template/
```

You can then run the test cases with:

```shell
xcodebuild test -configuration Debug -sdk "macosx" -destination "platform=macosx" -skipPackagePluginValidation -scheme DemoLibKotlin
```






