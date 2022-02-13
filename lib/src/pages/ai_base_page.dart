import 'package:flutter/material.dart';
import '../models/ai_display_area_model.dart';
import '../models/ai_base_model.dart';

// ignore: must_be_immutable
abstract class AiBaseStatelessWidget extends StatelessWidget {
  AiBaseStatelessWidget({Key? key}) : super(key: key);
  // get device width and height
  double get dvWidth => AiDisplayAreaModel.displayWidth;
  double get dvHeight => AiDisplayAreaModel.displayHeight;
  Size? get dvSize => AiDisplayAreaModel.displaySize;
  BuildContext? pageContext;

  @protected
  void changeBaseDeviceWidth(double aNewWidth) => AiDisplayAreaModel.displayWidth = aNewWidth;

  @protected
  void changeBaseDeviceHeight(double aNewHeight) => AiDisplayAreaModel.displayHeight = aNewHeight;

  @protected
  Widget internalBuild(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    pageContext = context;
    if (!AiDisplayAreaModel.initialized) AiDisplayAreaModel.instance.init(context);
    return internalBuild(context);
  }

  void debug(dynamic aObject) {
    if (AiDebugger.instance.isLogEnabled && aObject != null) print('Debugging from AI Class name : ${this.runtimeType} - $aObject');
  }
}

/* ------------------------------------------------------------------------------- */
// ignore: must_be_immutable
abstract class AiBaseStatefulWidget extends StatefulWidget {
  AiBaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class AiBaseState<Page extends AiBaseStatefulWidget> extends State<Page> {
  // get device width and height
  double get dvWidth => AiDisplayAreaModel.displayWidth;
  double get dvHeight => AiDisplayAreaModel.displayHeight;
  Size? get dvSize => AiDisplayAreaModel.displaySize;
  BuildContext? pageContext;

  @protected
  void changeBaseDeviceWidth(double aNewWidth) => AiDisplayAreaModel.displayWidth = aNewWidth;

  @protected
  void changeBaseDeviceHeight(double aNewHeight) => AiDisplayAreaModel.displayHeight = aNewHeight;

  @override
  void initState() {
    super.initState();
    pageContext = context;
  }

  @protected
  Widget internalBuild(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // now pageContext property is same as context
    if (!AiDisplayAreaModel.initialized) AiDisplayAreaModel.instance.init(context);
    return internalBuild(context);
  }

  void debug(dynamic aObject) {
    if (AiDebugger.instance.isLogEnabled && aObject != null) print('Debugging from AI Class name : ${this.runtimeType} - $aObject');
  }
}

// /* ------------------------------------------------------------------------------- */
// mixin AiStatelessScaffoldMixin on AiBaseStatelessWidget {
//   @protected
//   Widget internalBuildScaffold(BuildContext context) {
//     return Scaffold();
//   }
// }

// /* ------------------------------------------------------------------------------- */
// mixin AiStatefulScaffoldMixin on AiBaseState {
//   @protected
//   Widget internalBuildScaffold(BuildContext context) {
//     return Scaffold();
//   }
// }

// /* ------------------------------------------------------------------------------- */
// // ignore: must_be_immutable
// abstract class AiBasicStatelessWidget extends AiBaseStatelessWidget with AiStatelessScaffoldMixin {  
//   @override
//   Widget internalBuild(BuildContext context) {
//     return internalBuildScaffold(context);
//   }
// }

// /* ------------------------------------------------------------------------------- */
// abstract class AiBasicStatfulWidget extends AiBaseStatefulWidget {
//   AiBasicStatfulWidget({Key key}) : super(key: key);
// }

// /* ------------------------------------------------------------------------------- */
// abstract class AiBasicState<AiBasicStatefulWidget extends AiBaseStatefulWidget> extends AiBaseState with AiStatefulScaffoldMixin {
//   @override
//   Widget internalBuild(BuildContext context) {
//     return internalBuildScaffold(context);
//   }
// }

// /* ------------------------------------------------------------------------------- */
// class CustomBasicPage extends AiBaseStatefulWidget {
//   @override
//   CustomBasicPageState createState() => CustomBasicPageState();
// }

// class CustomBasicPageState<AiBasicStatefulWidget extends AiBaseStatefulWidget> extends AiBasicState<CustomBasicPage> {
//   @protected
//   AppBar internalBuildAppBar() {
//     return AppBar();
//   }  
// }
// /* ------------------------------------------------------------------------------- */
// class TestPage extends CustomBasicPage {
//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends CustomBasicPageState<TestPage> {
  
//   @override
//   Widget internalBuildScaffold(BuildContext context) {    
//     return Scaffold(
//       appBar: this.internalBuildAppBar(),
//       body: null,
//     );
//   }
// }
// /* ------------------------------------------------------------------------------- */