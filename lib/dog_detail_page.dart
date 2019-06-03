import 'package:flutter/material.dart';
import 'dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;
  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  final double dogAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 10) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.dog.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error!'),
            content: Text("They're good dogs, Brant."),
            actions: <Widget>[
              FlatButton(
                child: Text('Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return RaisedButton(
      onPressed: updateRating,
      child: Text('Submit'),
      color: Colors.indigoAccent,
    );
  }

  Widget get dogImage {
    var dogAvatar = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.dog.imageUrl ?? ''))),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.blueGrey[600]])),
      alignment: Alignment.center,
      child: Text(
        'DOGGO',
        textAlign: TextAlign.center,
      ),
    );

    return AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: widget.dog.imageUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(microseconds: 1000),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(
          '${widget.dog.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get dogProfile {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [.1, .5, .7, .9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400]
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: ListView(
        children: <Widget>[dogProfile, addYourRating],
      ),
    );
  }
}
