# CountryKit

A Package that uses the Locale framework to allow users to fetch a predefined list of countries, their flags and their calling codes.

The View uses a ```CountryPicker``` constructor wrapper to show the picker view and returns three constants in return in a closure.

Country Flag
Country Name
Country Code

Light Mode
![Simulator Screen Recording - iPhone 14 Pro - 2023-07-07 at 12 16 54](https://github.com/devdchaudhary/VoiceRecorderKit/assets/52855516/cb821879-1d9d-4f3f-87ad-755e1f74258c)

Supports Dark Mode
![Simulator Screen Recording - iPhone 14 Pro - 2023-06-16 at 07 08 05](https://github.com/devdchaudhary/VoiceRecorder/assets/52855516/82a9408a-cec8-4559-a366-6608276f890e)

Requirements

iOS 15,
Swift 5.0
Xcode 13.0+

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
import CountryPicker

struct ContentView: View {
    
    @StateObject var recorder = AudioRecorder(numberOfSamples: 15, audioFormatID: kAudioFormatAppleLossless, audioQuality: .max)
        
    var body: some View {
        VStack {
            List {
                ForEach(recorder.recordings, id: \.uid) { recording in
                    VoicePlayerView(audioUrl: recording.fileURL)
                        .onAppear {
                            print(recording.fileURL)
                        }
                }
                .onDelete { indexSet in
                    delete(at: indexSet)
                }
            }
            .listStyle(.inset)
            Spacer()
            VoiceRecorderView(audioRecorder: recorder)
        }
        .onAppear {
            recorder.fetchRecordings()
        }
    }
    
    func delete(at offsets: IndexSet) {

        var recordingIndex: Int = 0

        for index in offsets {
            recordingIndex = index
        }

        let recording = recorder.recordings[recordingIndex]
        recorder.deleteRecording(url: recording.fileURL, onSuccess: {
            recorder.recordings.remove(at: recordingIndex)
            DropView.showSuccess(title: "Recording removed!")
        })
    }
}
```
