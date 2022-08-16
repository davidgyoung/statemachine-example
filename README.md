# statemachine test app

This app implements the sample code for the StateMachine library here: https://github.com/Tinder/StateMachine

## How to build

1. Open statemachine.xcodeproj in XCode
2. Choose a simulator as a target
3. Product -> Run

## What you should see

There is nothing shown on the Phone!  Go to View -> Debug Area -> Activate console in XCode and you should see stuff like this:

```
2022-08-16 14:09:51.152538-0400 statemachine[77541:4322622] state should start with solid: true
2022-08-16 14:09:51.152628-0400 statemachine[77541:4322622] melted
2022-08-16 14:09:51.152686-0400 statemachine[77541:4322622] state should be liquid after melt: true
2022-08-16 14:09:51.152980-0400 statemachine[77541:4322622] side effect should be: Optional(statemachine.ExampleStateMachine.SideEffect.logMelted)
2022-08-16 14:09:51.153045-0400 statemachine[77541:4322622] state should be liquid after melt again: true
2022-08-16 14:09:51.153083-0400 statemachine[77541:4322622] side effect should be nil: nil
```

## Changing the code

Look at ExampleStateMachine.swift, which has all the code of interest.
The test() method has code that runs on app start and logs stuff.  It shows
code that fires events and checks state transitions and side effects.
