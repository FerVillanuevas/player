import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
        borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/art.jpg'), fit: BoxFit.cover)
                  ),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: (){},
                  ),
                ),
              )
            ],

          ),
          Text('Up next', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 14.0),)
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

          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 70,
              width: 70,
              color: Colors.redAccent,
              child: IconButton(
                icon: Icon(FontAwesomeIcons.play, color: Colors.white,),
                onPressed: null
              ), 
              
            ),
          ),
          
          IconButton(icon: Icon(FontAwesomeIcons.stepForward, color: Colors.white), onPressed: null)

        ],
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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //TODO: Back Art

          Stack(
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(250),
                  child: Image.asset('assets/art.jpg')
                ),
              )
            ],
          )

          //TODO: Next Art
        ]
      )
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40.0,
      margin: EdgeInsets.symmetric(vertical: 15.0),
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