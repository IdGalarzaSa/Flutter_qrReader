This application aims to read a QR code that contains a web address or a geoposition based on longitude and latitude.

In case the qr code contains a web address, the application will redirect to the respective web page.

In case the qr code contains a geoposition, it will open google maps and create a marker in that position.

For both cases, each QR code will be recorded in an internal database within the cell phone so that it can be accessed whenever desired

## Instructions for use

### Add the Google Maps key

To use this application you need to provide a Google Maps key for each platform. (Android and / or ios).

Android:
You must enter the Google Maps key in the route:
"android / app / src / main / AndroidManifest.xml:"

IOS:
You must enter the Google Maps key in the route:
"ios / Runner / AppDelegate.swift"

In both cases, the string "YOUR KEY HERE" must be replaced by the respective key.

### Use QR code

#### Web address

To use a QR code with a web address, the full path must be specified including the port "HTTp" or "https"

examples:

- https://flutter.dev/
- https://www.google.com.bo

#### Geoposition

To use google maps based on longitude and latitude it is necessary to comply with the following format

"geo: lat, long"

Note: It must not contain spaces

Example:

- "geo: -20.33014, -67.04707"