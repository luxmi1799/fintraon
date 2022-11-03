import 'package:flutter/material.dart';

class mpinanimation extends StatefulWidget{
   final mpinanimationcontroller controller;

  mpinanimation({Key? key,required this.controller}) :super(key: key);

  @override
  State<StatefulWidget> createState() {
     return _mpinanimation();
  }
}

class _mpinanimation extends State<mpinanimation>
    with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation<double>? _sizeanimation;
  Animation<double>? _opacityanimation;

  void animate(){
    _controller!.forward();
  }
  mpinanimation(controller){
    controller.animate = animate;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 200));
    _controller!.addListener(() {
      if(_controller!.status == AnimationStatus.completed){
        _controller!.reverse();
      }
      setState(() {

      });
    });
    _sizeanimation = Tween<double>(begin: 24,end: 72).animate(_controller!);
    _opacityanimation = Tween<double>(begin: 0,end: 1).animate(_controller!);

  }

  @override
  Widget build(BuildContext context) {
  return Container(
    height: _sizeanimation!.value,width: _sizeanimation!.value,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular( _sizeanimation!.value/2),
      color: Colors.white,
    ),
    child:  Center(child: Opacity(
        opacity: _opacityanimation!.value,
        child: Transform.scale(
          scale: _sizeanimation!.value/48,
            child: Text("12")
        ))),
   );
  }
}

class mpinanimationcontroller {
   void Function()? animate;
}