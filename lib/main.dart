import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'Screens/ImageSearchPage/Views/image_show_view.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';
import 'global.dart';

// import file locations for routings
import 'package:flutter/services.dart';

import 'Screens/Task/User/userTaskHome.dart';
import 'package:eventsy/Screens/Planners/splashPlanners.dart';
import 'package:eventsy/Screens/Task/User/TaskList.dart';
import 'package:eventsy/Screens/Task/User/userDashboard/userDashboard.dart';
import 'package:eventsy/Screens/Task/User/settings/settings.dart';
import 'package:flutter/material.dart';
import 'Screens/Home/ImageExplore.dart';
import 'Screens/Home/home.dart';
import 'Screens/Home/VendorExplore.dart';
import 'Screens/Home/TaskExplore.dart';
import 'Screens/Task/User/userTaskHome.dart';
import 'Screens/LoginandSignUpScreens/logoutscreen.dart';
import 'Screens/LoginandSignupScreens/signupoptionpage.dart';
import 'Screens/LoginandSignupScreens/signup.dart';
import 'Screens/LoginandSignUpScreens/loginpage.dart';

import 'Screens/Task/User/AddTask.dart';
import 'Screens/Task/Planner/PlannerrTaskHome.dart';
import 'Screens/Task/Planner/eventList.dart';
import 'Screens/Task/Planner/addEventDetails.dart';

// import 'Screens/BudgetCalculatorScreens/advancebudgetaddingpage.dart';
// import 'Model/Budgetcal/eventset.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/eventselectionpage.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/categoryshownpage.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/categorydetailsshowpage.dart';

import 'Screens/BudgetCalculatorScreens/UserBudgetCal/usercategorydetailsshowpage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive and get the application documents directory
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.initFlutter();
  //for Planner Budget
  Hive.registerAdapter(BudgetEventAdapter());
  Hive.registerAdapter(BudgetTaskAdapter());

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(EventTasksAdapter());
  Hive.registerAdapter(InvitationAdapter());

  eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
  taskbudgetBox = await Hive.openBox<BudgetTask>('budgettask');
  eventBox = await Hive.openBox<Event>('event');
  taskBox = await Hive.openBox<Task>('task');
  eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
  invitationBox = await Hive.openBox<Invitation>('invitation');
// void main()=>runApp(
//     DevicePreview(

//       builder:(context)=> FirstPage(),
//     ),
//   );
// }

// void main() {
  runApp(FirstPage());
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'UserHome': (context) => UserTaskHome(),
          '/ImageExplore': (context) => ImageExplore(),
          '/VendorExplore': (context) => VendorExplore(),
          '/TaskExplore': (context) => TaskExplore(),

          ////////USER TASK////////
          'UserHome': (context) => UserTaskHome(),
          'TaskList': (context) => TaskList(),
          'addTask': (context) => AddTask(),
          '/userDashboard': (context) => userDashboard(),
          '/userSettings': (context) => userSettings(),

          /////////PLANNER TASK/////////

          'PlannerHome': (context) => PlannerTaskHome(),

          '/PlannersPage': (context) => const SplashScreen(),
          '/EventList': (context) => const EventList(),
          'addEventDetails': (context) => addEventDetails(),

          /////////////// LOGIN ////////////////////////////
          'LoginPage': (context) => Loginpage(),
          './SignUpPage': (context) => SignUpPage(),
          './SignUpOptionPage': (context) => SignUpOptionPage(),
          './LogOutScreen': (context) => LogOutScreen(),

          //////////budget calculator screens////////////////
          'EventselectionPage': (context) => EventSelectionPage(),
          'CategoryShownPage': (context) => CategoryShownPage(),
          './CategoryDetailsShownPage': (context) =>
              CategoryDetailsShownPage(eventName: ''),

          'UserCategoryDetailsShownPage': (context) =>
              UserCategoryDetailsShownPage(
                eventName: '',
              ),
        },
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        home: ImageExplore());
  }
}
