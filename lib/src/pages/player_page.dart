import 'dart:math';
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:player/src/providers/player_provider.dart';
import 'package:provider/provider.dart';


class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _BackGround(),

            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _AppBar(),

                  _CoverArt(),

                  _Title(),

                  _Actions(),

                  _UpNext()

                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UpNext extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(right: 10.0, left: 10.0, top:20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/art.jpg'), fit: BoxFit.cover)
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: (){},
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Back to Sleep', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Chris Brown - Royality', style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54
                  ))
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(FontAwesomeIcons.ellipsisV, color: Colors.black,),
              )
            ],
          ),
          Divider(
            height: 20.0,
            color: Colors.black26,
            thickness: 0.5,
          ),
    Text('Up next', style: TextStyle(color: Color(0xffDE2919), fontWeight: FontWeight.w500, fontSize: 20.0),)
        ],
      )
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.stepBackward, color: Colors.white), onPressed: null),

          _PlayBottom(),
          
          IconButton(icon: Icon(FontAwesomeIcons.stepForward, color: Colors.white), onPressed: null)

        ],
      ),
    );
  }
}

class _PlayBottom extends StatefulWidget {
  const _PlayBottom({
    Key key,
  }) : super(key: key);

  @override
  __PlayBottomState createState() => __PlayBottomState();
}

class __PlayBottomState extends State<_PlayBottom> {

  final audio = new AssetsAudioPlayer();
  bool first = true;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void open() {
    final player = Provider.of<PlayerProvider>(context, listen: false);
    audio.open(Audio('assets/audio.mp3'));

    audio.currentPosition.listen( (duration) {
      player.current = duration;
    });

    audio.current.listen((playing) {
      player.duration = playing.audio.duration;
    });

  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 100,
        width: 100,
        color: Color(0xffE9403B),
        child: IconButton(
          icon: Icon(FontAwesomeIcons.play, color: Colors.white,),
          onPressed: () {
            if(first) {
              open();
              first = false;
            } else {
              audio.playOrPause();
            }
          }
        ), 
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            'Back to Sleep', 
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Chris Brown - Royality', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.7)),
          )
        ],
      ),
    );
  }
}

class _CoverArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final text = TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //TODO: Back Art

          Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: _ProgressBar(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(250),
                        child: Image.asset('assets/art.jpg')
                      ),
                    ),
                  ],
                )
              ),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('4:05', style: text,),
                    Text('6:35', style: text,)
                  ],
                ),
              ),
            ],
          )

          //TODO: Next Art
        ]
      )
    );
  }
}
class _ProgressBar extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.grey.withOpacity(0.8)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final paintOver = new Paint()
      ..color = Color(0xffE9403B)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final c = new Offset(size.width / 2, size.height / 2);
    
    canvas.drawArc(
      Rect.fromCenter(
        center: c,
        height: size.height,
        width: size.width,
      ), 
      pi * 0.7, 
      (2 * pi) * 0.8 , 
      false, 
      paint
    );

    final path = new Path();
    path.addArc(
      Rect.fromCircle(
        center: c,
        radius: 150
      ), 
      pi * 0.7, 
      (0.6 * pi) * 0.8
    );

    canvas.drawPath(path, paintOver);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

}
class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40.0,
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: IconButton(
        icon: Icon( FontAwesomeIcons.stream, color: Colors.white, ), 
        onPressed: (){}
      )
    );
  }
}

class _BackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/art.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}