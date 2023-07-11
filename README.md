# CountryKit

A Package that uses the Locale framework to allow users to fetch a predefined list of countries, their flags and their calling codes.

The View uses a ```CountryPicker``` constructor wrapper to show the picker view and returns three constants in return in a closure.

Country Flag

Country Name

Country Code

Requirements

iOS 15,
Swift 5.0
Xcode 13.0+

![Untitled-2](https://github.com/devdchaudhary/CountryKit/assets/52855516/d7fb41d9-1554-476c-b30e-b1ebd5362c8b)

Installation

Swift Package Manager

To integrate VoiceRecorderPackage into your Xcode project, specify it in Package Dependancies > Click the "+" button > Copy and paste the URL below:

```https://github.com/devdchaudhary/CountryKit```

set branch to "master"

Check CountryKit

Click Add to Project

Usage

Step 1 : Import ```CountryKit```

Step 2 : Call the ```CountryPicker``` view inside your Main View.

Step 3: Pass in three state variables that will update upon your closure running when the view is dismissed.

Below is an example demonstrating the use of the CountryPicker View.

```
import SwiftUI
import CountryKit

struct ContentView: View {
    
    @State private var showPicker = false
    
    @State private var code = ""
    @State private var flag = ""
    @State private var countryName = ""
    
    var body: some View {
        
        VStack {
            
            Button {
                showPicker.toggle()
            } label: {
                Text("Show Picker")
            }
            .padding(.bottom)
            
            HStack {
                Text(flag)
                Text(countryName)
                Text("+\(code)")
                    .foregroundColor(.primaryText)
            }
            
        }
        .padding()
        .fullScreenCover(isPresented: $showPicker) {
            CountryPicker { countryFlag, name, countryCode in
                flag = countryFlag
                countryName = name
                code = countryCode
            }
        }
    }
}

```
