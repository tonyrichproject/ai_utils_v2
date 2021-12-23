import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

const kOpacity = 'opacity';
const kScale = 'scale';
const kMotion = 'motion';

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget scaleAnimation(
  Widget aChildWidget, {
  int aMilliseconds = 1000,
  double aStartSize = 10,
  double aEndSize = 1,
  bool aIsFadeWhenDone = false,
  Curve aCurve = Curves.easeInOut,
}) {
  double opacityBegin = aIsFadeWhenDone ? 1 : 0;
  double opacityEnd = aIsFadeWhenDone ? 0 : 1;
  return Animator(
    tweenMap: {
      kOpacity: Tween<double>(begin: opacityBegin, end: opacityEnd),
      kScale: Tween<double>(begin: aStartSize, end: aEndSize),
      kMotion: Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0)),
    },
    duration: Duration(milliseconds: aMilliseconds),
    // duration: Duration(milliseconds: 400),
    cycles: 1,
    curve: aCurve,
    builder: (_, anim, __) => FadeTransition(
      opacity: anim.getAnimation(kOpacity),
      child: Transform.scale(
        scale: anim.getValue(kScale),
        child: Transform.translate(
          offset: anim.getValue(kMotion),
          child: aChildWidget,
        ),
      ),
    ),
  );
}

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget motionAnimation(
  Widget aChildWidget,
  bool aIsVertical, {
  int aMilliseconds = 1000,
  double aStartPosition = 100,
  Curve aCurve = Curves.easeInOut,
}) {
  final double xPos = (aIsVertical) ? 0 : aStartPosition;
  final double yPos = (aIsVertical) ? aStartPosition : 0;

  return Animator(
    tweenMap: {
      kOpacity: Tween<double>(begin: -3, end: 1),
      kMotion: Tween<Offset>(begin: Offset(xPos, yPos), end: Offset.zero),
    },
    duration: Duration(milliseconds: aMilliseconds),
    // duration: Duration(milliseconds: 400),
    cycles: 1,
    curve: aCurve,
    builder: (_, anim, __) => FadeTransition(
      opacity: anim.getAnimation(kOpacity),
      child: Transform.translate(
        offset: anim.getValue(kMotion),
        child: aChildWidget,
      ),
    ),
  );
}

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget zoomInAnimation(
  Widget aChildWidget, {
  int aMilliseconds = 1000,
  double aStartSize = 10,
  double aEndSize = 1,
  bool aIsFadeWhenDone = false,
  // int aDelayMilliSeconds = 0,
  Curve aCurve = Curves.easeInOut,
}) {
  return scaleAnimation(
    aChildWidget,
    aMilliseconds: aMilliseconds,
    aStartSize: aStartSize,
    aEndSize: aEndSize,
    aIsFadeWhenDone: aIsFadeWhenDone,
    aCurve: aCurve,
    // aDelayMilliSeconds: aDelayMilliSeconds,
  );
}

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget zoomOutAnimation(
  Widget aChildWidget, {
  int aMilliseconds = 1000,
  double aStartSize = 1,
  double aEndSize = 10,
  bool aIsFadeWhenDone = false,
  Curve aCurve = Curves.easeInOut,
}) {
  return scaleAnimation(
    aChildWidget,
    aMilliseconds: aMilliseconds,
    aStartSize: aStartSize,
    aEndSize: aEndSize,
    aIsFadeWhenDone: aIsFadeWhenDone,
    aCurve: aCurve,
  );
}

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget verticalAnimation(
  Widget aChildWidget, {
  int aMilliseconds = 1000,
  double aStartPosition = 60,
  Curve aCurve = Curves.easeInOut,
  bool aIsAnimated = true,
}) {
  if (aIsAnimated)
    return motionAnimation(
      aChildWidget,
      true,
      aMilliseconds: aMilliseconds,
      aStartPosition: aStartPosition,
      aCurve: aCurve,
    );
  else
    return aChildWidget;
}

/* ------------------------------------------------------------------------------------------------------------------------ */
Widget horizontalAnimation(
  Widget aChildWidget, {
  int aMilliseconds = 1000,
  double aStartPosition = 60,
  Curve aCurve = Curves.easeInOut,
  bool aIsAnimated = true,
}) {
  if (aIsAnimated)
    return motionAnimation(
      aChildWidget,
      false,
      aMilliseconds: aMilliseconds,
      aStartPosition: aStartPosition,
      aCurve: aCurve,
    );
  else
    return aChildWidget;
}

/* ------------------------------------------------------------------------------------------------------------------------ */
