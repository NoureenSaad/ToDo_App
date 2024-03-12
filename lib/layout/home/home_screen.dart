import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home/provider/home_provider.dart';
import 'package:todo_app/layout/home/tabs/list_tab.dart';
import 'package:todo_app/layout/home/tabs/settings_tab.dart';
import 'package:todo_app/layout/home/widgets/add_task_sheet.dart';
import 'package:todo_app/layout/login/login_screen.dart';
import 'package:todo_app/shared/providers/auth_data_provider.dart';
import 'package:todo_app/style/app_colors.dart';
 
class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [ListTab(),SettingsTab()];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardOpen? null : FloatingActionButton(
        onPressed: (){
          if(!isSheetOpen){
            AddTaskBottomSheet(context);
            isSheetOpen = true;
          }else{
            Navigator.pop(context);
            isSheetOpen = false;
          }
          setState(() {

          });
        },
        child: isSheetOpen?Icon(Icons.check,color: Colors.white,size: 20,):Icon(Icons.add,color: Colors.white,size: 20,),
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4
          )
        ),
      ),
      appBar: AppBar(
        title: Text("ToDo List"),
        actions: [
          IconButton(
              onPressed: ()async{
                await provider.SignOut();
                Navigator.pushReplacementNamed(context, LoginScreen.route);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 25,
              )
          ),
        ],
        backgroundColor: AppColors.primaryLightColor,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        notchMargin: 15,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (index){
            homeProvider.changeTab(index);
          },
          currentIndex: homeProvider.currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/list.svg",
                colorFilter: ColorFilter.mode(AppColors.unselectedItemColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset("assets/images/list.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/settings.svg",
                colorFilter: ColorFilter.mode(AppColors.unselectedItemColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset("assets/images/settings.svg"),
                label: ""),
          ],
        ),
      ),
      body: Scaffold(
        key: scaffoldKey,
        body: tabs[homeProvider.currentIndex],
      ),
    );
  }

  void AddTaskBottomSheet(BuildContext context) {
    scaffoldKey.currentState?.showBottomSheet(
        (context)=>AddTaskSheet(
          onCancel: (){
            isSheetOpen = false;
            setState(() {

            });
          },
        ),
    );
  }
}


