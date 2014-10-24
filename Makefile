XCODEFLAGS=-workspace 'Carthage.xcworkspace' -scheme 'carthage'
BUILT_BUNDLE=/tmp/Carthage.dst/Applications/carthage.app

FRAMEWORKS_FOLDER=/Library/Frameworks
BINARIES_FOLDER=/usr/local/bin

all:
	xcodebuild $(XCODEFLAGS) build

clean:
	xcodebuild $(XCODEFLAGS) clean

install:
	xcodebuild $(XCODEFLAGS) install

	install -d "$(FRAMEWORKS_FOLDER)"
	rm -r "$(FRAMEWORKS_FOLDER)/CarthageKit.framework"
	cp -PR "$(BUILT_BUNDLE)/Contents/Frameworks/CarthageKit.framework" "$(FRAMEWORKS_FOLDER)/"

	install -d "$(BINARIES_FOLDER)"
	install -CSs "$(BUILT_BUNDLE)/Contents/MacOS/carthage" "$(BINARIES_FOLDER)/"
