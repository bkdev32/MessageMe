# 💬 MessageMe

Simple messaging app built in MVC design pattern using Firebase Authentication and Firestore

I have developed this app to practice Firebase and TableViews further. 

TableView is the bread and butter of a good iOS Developer so I wanted to work on TableView as much as possible to improve my skills. 

I have used Firebase Authentication to allow users to sign up/log in. The users can message each other and the messages are persisted online using Cloud Firestore.

To be able to move up the TextField with the keyboard on tap across all orientations and devices; I have used [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager9)

One of my challenges in this project was checking if the user has logged in during app launch and change the RootViewController accordingly, making sure NavigationController is initiated properly.

Although I can now see how basic the solutions were to all my struggles, at the time I had to spent some time to fully understand how different components like SceneDelegate, NavigationController, ViewController work and interact with each other.

The knowledge I gained in this project has been really helpful in my other projects since then - and helped me to avoid many sleepless nights! 😅


![Simulator Screen Shot - iPhone 12 - 2021-07-12 at 12 13 14](https://user-images.githubusercontent.com/11230240/125294564-47e96680-e31c-11eb-8839-97896f7f60e5.png)                                                 ![Simulator Screen Shot - iPhone 12 - 2021-07-12 at 12 13 31](https://user-images.githubusercontent.com/11230240/125294637-56d01900-e31c-11eb-90cf-7fa44dcf21c0.png)
  
## Roadmap
  
  I am currently adding new features such as;
  
  - Added Settings page to allow users to change/reset their password, change their username and moved the Log Out from main chat page
  - Ability to add friends/contacts
  - Abiltiy to create new chats/group chats
  

## Project Setup

To be able to run this project, you will need to have a [Firebase](https://firebase.google.com) account.

Set up a new project on Firebase Console and follow the instructions to add config file and Firebase SDK.

Clone the repository and run:

``` pod init ```

Add the following to your project Podfile

``` 
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'IQKeyboardManagerSwift'
   
```

Then run:

``` pod install ```

Once the setup is completed, you will need to create a Firestore database and set-up the user Authentication. You can access the Firebase docs at [firebase.google.com](https://firebase.google.com/docs/build) 

=====================


