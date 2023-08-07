// ignore_for_file: prefer_const_constructors

import 'package:eventsy/Screens/Task/Planner/addEventTask.dart';
import 'package:eventsy/Screens/Task/User/viewTask.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:eventsy/Model/Budgetcal/eventset.dart';
import 'package:eventsy/Model/Event.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';
import 'routes.dart';
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
import 'Screens/Task/Planner/addEvent.dart';
import 'Screens/Task/User/updateTask.dart';
import 'Screens/Task/Planner/eventTaskList.dart';
import 'Screens/Task/Planner/viewEvent.dart';
import 'Screens/Task/Planner/viewEventTask.dart';

import 'Screens/BudgetCalculatorScreens/categorydetailsshowpage.dart';
import 'Screens/BudgetCalculatorScreens/normalbudgetaddingpage.dart';
// import 'Screens/BudgetCalculatorScreens/advancebudgetaddingpage.dart';
// import 'Model/Budgetcal/eventset.dart';
import 'Screens/BudgetCalculatorScreens/eventselectionpage.dart';
import 'Screens/BudgetCalculatorScreens/categoryshownpage.dart';

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
  // Hive.registerAdapter(
  //   EventsetAdapter(),
  // );
  // Hive.registerAdapter(CategorySetAdapter());
  // Hive.registerAdapter(SubTaskSetAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(EventTasksAdapter());
  Hive.registerAdapter(InvitationAdapter());
  Hive.registerAdapter(UserModeAdapter());

  eventBox = await Hive.openBox<Event>('event');
  taskBox = await Hive.openBox<Task>('task');
  eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
  invitationBox = await Hive.openBox<Invitation>('invitation');
  userModeBox = await Hive.openBox<UserMode>('userMode');
// void main()=>runApp(
//     DevicePreview(

//       builder:(context)=> FirstPage(),
//     ),
//   );
// }

// void main() {
  // runApp(FirstPage());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(FirstPage());
  });
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/ImageExplore': (context) => ImageExplore(),
          '/VendorExplore': (context) => VendorExplore(),
          '/TaskExplore': (context) => TaskExplore(),

          ////////USER TASK////////
          'UserHome': (context) => UserTaskHome(),
          'TaskList': (context) => TaskList(),
          'addTask': (context) => AddTask(),
          '/viewTask': (context) => ViewTask(
              task: ModalRoute.of(context)!.settings.arguments as Task),
          '/userDashboard': (context) => userDashboard(),
          '/userSettings': (context) => userSettings(),
          '/updateTask': (context) => UpdateTask(
              Key: ModalRoute.of(context)!.settings.arguments as String),

          /////////PLANNER TASK/////////

          'PlannerHome': (context) => PlannerTaskHome(),
          '/eventTaskList': (context) => EventTaskList(
              event: ModalRoute.of(context)!.settings.arguments as Event),
          '/PlannersPage': (context) => const SplashScreen(),
          '/EventList': (context) => EventList(),
          '/addEvent': (context) => AddEvent(),
          '/viewEvent': (context) => ViewEvent(
              event: ModalRoute.of(context)!.settings.arguments as Event),
          '/addEventTask': (context) {
            final Map<String, dynamic> arguments = ModalRoute.of(context)
                ?.settings
                .arguments as Map<String, dynamic>;
            return AddEventTask(
              eventName: arguments['eventName'],
              eventKey: arguments['eventKey'],
            );
          },
          '/viewEventTask': (context) => ViewEventTask(
              task: ModalRoute.of(context)!.settings.arguments as EventTasks),

          /////////////// LOGIN ////////////////////////////
          'LoginPage': (context) => Loginpage(),
          './SignUpPage': (context) => SignUpPage(),
          './SignUpOptionPage': (context) => SignUpOptionPage(),
          './LogOutScreen': (context) => LogOutScreen(),

          //////////budget calculator screens////////////////
          // './EventselectionPage': (context) => EventSelectionPage(),
          'CategoryShownPage': (context) => CategoryShownPage(),
          // './NormalBudgetOptionPage': (context) => NormalBudgetOptionPage(),
          // './AdvanceBudgetOptionPage': (context) => AdvanceBudgetOptionPage(),
          './CategoryDetailsShownPage': (context) => CategoryDetalsShownPage(
                eventName: '',
              ),
        },
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        home: ImageExplore());
  }
}
