// import 'package:flutter/material.dart';
//
// extension SmoothAnimationExtension on Widget {
//
//   /**
//    example:
//
//       HomeServiceCard(
//       icon: IconsaxPlusLinear.box,
//       title: context.tr('assets_docs.asset_docs'),
//       onTap: () async {
//       final canProceed = await getIt<SettingsCubit>()
//       .authenticateForAssetDocs();
//       if (canProceed && context.mounted) {
//       context.goAssetsDocsMainScreen();
//       }
//       },
//       ).animateEntrance(index: 0),
//
//    */
//   Widget animateEntrance({
//     Key? key,
//     int index = 0,
//     Duration duration = AppMotion.medium,
//     double offset = 24.0,
//     Curve curve = AppMotion.enter,
//   }) {
//     return _AnimatedEntranceWidget(
//       key: key,
//       index: index,
//       duration: duration,
//       offset: offset,
//       curve: curve,
//       child: this,
//     );
//   }
//
//   Widget addTapScale({
//     Key? key,
//     VoidCallback? onTap,
//     double scaleDown = 0.96,
//     Duration duration = AppMotion.instant,
//   }) {
//     return _AnimatedTapScaleWidget(
//       key: key,
//       onTap: onTap,
//       scaleDown: scaleDown,
//       duration: duration,
//       child: this,
//     );
//   }
//
//   Widget animatedSize({
//     Key? key,
//     Duration duration = AppMotion.medium,
//     Curve curve = AppMotion.standard,
//     Alignment alignment = Alignment.topCenter,
//   }) {
//     return AnimatedSize(
//       key: key,
//       duration: duration,
//       curve: curve,
//       alignment: alignment,
//       child: this,
//     );
//   }
// }
//
// class _AnimatedEntranceWidget extends StatefulWidget {
//   final Widget child;
//   final int index;
//   final Duration duration;
//   final double offset;
//   final Curve curve;
//
//   const _AnimatedEntranceWidget({
//     super.key,
//     required this.child,
//     this.index = 0,
//     this.duration = AppMotion.medium,
//     this.offset = 24.0,
//     this.curve = AppMotion.enter,
//   });
//
//   @override
//   State<_AnimatedEntranceWidget> createState() =>
//       _AnimatedEntranceWidgetState();
// }
//
// class _AnimatedEntranceWidgetState extends State<_AnimatedEntranceWidget>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _fadeAnimation;
//   late final Animation<Offset> _slideAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.duration);
//
//     final curvedAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: widget.curve,
//     );
//
//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(curvedAnimation);
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(0, widget.offset / 100),
//       end: Offset.zero,
//     ).animate(curvedAnimation);
//
//     final delayMs = (widget.index.clamp(0, 5) * 50);
//     if (delayMs > 0) {
//       Future.delayed(Duration(milliseconds: delayMs), () {
//         if (mounted) _controller.forward();
//       });
//     } else {
//       _controller.forward();
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(position: _slideAnimation, child: widget.child),
//     );
//   }
// }
//
// class _AnimatedTapScaleWidget extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onTap;
//   final double scaleDown;
//   final Duration duration;
//
//   const _AnimatedTapScaleWidget({
//     super.key,
//     required this.child,
//     this.onTap,
//     this.scaleDown = 0.96,
//     this.duration = AppMotion.instant,
//   });
//
//   @override
//   State<_AnimatedTapScaleWidget> createState() =>
//       _AnimatedTapScaleWidgetState();
// }
//
// class _AnimatedTapScaleWidgetState extends State<_AnimatedTapScaleWidget>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.duration);
//     _scaleAnimation = Tween<double>(
//       begin: 1.0,
//       end: widget.scaleDown,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _onTapDown(TapDownDetails _) {
//     _controller.forward();
//   }
//
//   void _onTapUp(TapUpDetails _) {
//     _controller.reverse();
//     widget.onTap?.call();
//   }
//
//   void _onTapCancel() {
//     _controller.reverse();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.onTap == null) {
//       return widget.child;
//     }
//
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTapDown: _onTapDown,
//       onTapUp: _onTapUp,
//       onTapCancel: _onTapCancel,
//       child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
//     );
//   }
// }
