import 'package:rive/rive.dart';

class TabItem {
  TabItem({
    this.stateMachine = "",
    this.artboard = "",
    this.status,
  });

  String stateMachine;
  String artboard;
  late SMIBool? status;

  static List<TabItem> tabItemsList = [
    TabItem(stateMachine: "CHAT_Interactivity", artboard: "CHAT"),
    // TabItem(stateMachine: "STAR_Interactivity", artboard: "STAR"),
    TabItem(stateMachine: "SEARCH_Interactivity", artboard: "SEARCH"),
    TabItem(stateMachine: "TIMER_Interactivity", artboard: "TIMER"),
    TabItem(stateMachine: "BELL_Interactivity", artboard: "BELL"),
    TabItem(stateMachine: "USER_Interactivity", artboard: "USER"),
  ];
}
