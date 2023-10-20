// ignore_for_file: prefer_const_constructors

import 'package:eventsy/Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/budgetaddedlist.dart';
import 'package:eventsy/Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/updatebudgettask.dart';
import 'package:eventsy/Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/viewbudgettask.dart';
import 'package:eventsy/Screens/Task/Planner/addEventTask.dart';
import 'package:eventsy/Screens/Task/User/viewTask.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/budgettasklist.dart';
import 'Screens/ImageSearchPage/Views/image_show_view.dart';
import 'Screens/LoginandSignupScreens/firebase_options.dart';

import 'Screens/Task/Planner/updateEvent.dart';
import 'Screens/Task/Planner/updateEventTask.dart';
import 'global.dart';
import 'Model/Event.dart';

// import file locations for routings
import 'package:flutter/services.dart';

import 'Screens/Task/User/userTaskHome.dart';
import 'package:eventsy/Screens/Planners/splashPlanners.dart';
import 'package:eventsy/Screens/Task/User/TaskList.dart';

import 'package:eventsy/Screens/Task/User/userDashboard/userDashboard.dart';
import 'package:eventsy/Screens/Task/User/settings/settings.dart';

import 'package:flutter/material.dart';

import 'Screens/Home/ImageExplore.dart';
import 'Screens/Home/TicketHandling.dart';
import 'Screens/Home/VendorExplore.dart';
import 'Screens/Home/TaskExplore.dart';

import 'Screens/LoginandSignUpScreens/logoutscreen.dart';
import 'Screens/LoginandSignupScreens/signupoptionpage.dart';
import 'Screens/LoginandSignupScreens/signup.dart';
import 'Screens/LoginandSignUpScreens/loginpage.dart';
import 'Screens/LoginandSignUpScreens/resetpassword.dart';

import 'Screens/Task/User/AddTask.dart';

import 'Screens/Task/Planner/PlannerrTaskHome.dart';
import 'Screens/Task/Planner/eventList.dart';

//import 'Screens/Task/Planner/addEventDetails.dart';

// import 'Screens/BudgetCalculatorScreens/advancebudgetaddingpage.dart';
// import 'Model/Budgetcal/eventset.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/budgetaddingoption.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/eventselectionpage.dart';
import 'Screens/BudgetCalculatorScreens/EventPlannerBudgetCal/categoryshownpage.dart';

import 'Screens/Task/Planner/addEvent.dart';
import 'Screens/Task/User/updateTask.dart';
import 'Screens/Task/Planner/eventTaskList.dart';
import 'Screens/Task/Planner/viewEvent.dart';
import 'Screens/Task/Planner/viewEventTask.dart';

// import 'Screens/BudgetCalculatorScreens/advancebudgetaddingpage.dart';
// import 'Model/Budgetcal/eventset.dart';

import 'package:eventsy/Screens/Task/User/settings/ProfileSettingsPage.dart';
import 'package:eventsy/Screens/Task/User/settings/Notification.dart';
import 'package:eventsy/Screens/Task/User/settings/help_support.dart';
import 'package:eventsy/Screens/Task/User/settings/RateUs.dart';
import 'package:eventsy/Screens/Task/User/settings/privacy_Security.dart';
import 'package:eventsy/Screens/Task/User/settings/logout.dart';


import 'package:eventsy/Screens/Tickets/ticketHandlingHome.dart';


import 'package:eventsy/Screens/Task/User/vendors/vendorlist.dart';



import 'package:eventsy/Screens/Task/User/userDashboard/Tasks/your_tasks.dart';


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
  // Hive.registerAdapter(BudgetEventAdapter());

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(EventTasksAdapter());
  Hive.registerAdapter(BudgetTasksAdapter());
  Hive.registerAdapter(InvitationAdapter());


  // eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
  // taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');
  eventBox = await Hive.openBox<Event>('event');
  taskBox = await Hive.openBox<Task>('task');
  eventTaskBox = await Hive.openBox<EventTasks>('eventTask');
  budgetTaskBox = await Hive.openBox<BudgetTasks>('budgetTask');
  invitationBox = await Hive.openBox<Invitation>('invitation');

//eventbudgetBox = await Hive.openBox<BudgetEvent>('budgetevent');
//taskbudgetBox = await Hive.openBox<BudgetEvent>('budgettask');
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
          '/ImageExplore': (context) => ImageExplore(),
          '/VendorExplore': (context) => VendorExplore(),
          '/TaskExplore': (context) => TaskExplore(),
          '/TicketHandling': (context) => TicketHandling(),

          ////////TicketHandling/////////////

          '/ticketHandlingHome': (context) => TicketHandlingHome(),

          ////////USER TASK////////
          'UserHome': (context) => UserTaskHome(),
          'TaskList': (context) => TaskList(),
          'addTask': (context) => AddTask(),
          '/userDashboard': (context) => UserDashboard(),
          '/userSettings': (context) => userSettings(),

          '/viewTask': (context) => ViewTask(
              task: ModalRoute.of(context)!.settings.arguments as Task),

          '/userDashboard': (context) => UserDashboard(),
          '/userSettings': (context) => userSettings(),

          '/updateTask': (context) => UpdateTask(
              task: ModalRoute.of(context)!.settings.arguments as Task),

          /////////PLANNER TASK/////////

          'PlannerHome': (context) => PlannerTaskHome(),
          '/updateEvent': (context) => UpdateEvent(
              event: ModalRoute.of(context)!.settings.arguments as Event),
          '/updateEventTask': (context) => UpdateEventTask(
              task: ModalRoute.of(context)!.settings.arguments as EventTasks),
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
              event: arguments['event'],
            );
          },
          '/viewEventTask': (context) {
            final Map<String, dynamic> arguments = ModalRoute.of(context)
                ?.settings
                .arguments as Map<String, dynamic>;
            return ViewEventTask(
                task:arguments['task'],
                event: arguments['event'],);
          },

          /////////////// LOGIN ////////////////////////////
          'LoginPage': (context) => Loginpage(),
          './SignUpPage': (context) => SignUpPage(),
          './SignUpOptionPage': (context) => SignUpOptionPage(),
          './LogOutScreen': (context) => LogOutScreen(),
           './forgetpasswordPage':(context) => ResetPassword(),
          //////////budget calculator screens////////////////
          'BudgetAddingEventList': (context) => BugetAddingEventList(),
          // 'EventselectionPage': (context) => EventSelectionPage(),
          'BudgetTaskList': (context) => BudgetTaskList(
                budget: ModalRoute.of(context)!.settings.arguments as Event,
              ),
          'BudgetAddedList': (context) {
            // Cast arguments to the correct type, which is List<BudgetTasks>
            final List<BudgetTasks> budgetList =
                ModalRoute.of(context)!.settings.arguments as List<BudgetTasks>;

            return BudgedAddedList(budgetList: budgetList);
          },

          'ViewBudgetTask': (context) => ViewBudgetTasks(
              budget:
                  ModalRoute.of(context)!.settings.arguments as BudgetTasks),

            'UpdateBudgetTask':(context) => UpdateBudgetTasks( task: ModalRoute.of(context)!.settings.arguments as BudgetTasks),




            ///Image Search  ///
           
'ImageShowView': (context) => ImageShowView(shouldShowImages: true),

          

          /////SETTINGS///
          'ProfileSettingsPage': (context) => ProfileSettingsPage(),
          'NotificationSettingsPage': (context) => NotificationSettingsPage(),
          'FeedbackAndContactPage': (context) => FeedbackAndContactPage(),
          'SimpleRatingBar': (context) => SimpleRatingBar(),
          'PasswordChangePage': (context) => PasswordChangePage(),
          'LogoutPage': (context) => LogoutPage(),



          //vendor//
          'VendorList':(context)=>VendorList(),

          //dashboard//
          'your_tasks': (context) => your_tasks(),



        },
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Eventsy',
        home: ImageExplore());
  }
}
