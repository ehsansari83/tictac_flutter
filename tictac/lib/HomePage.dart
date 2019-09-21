import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO:Link images
  
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  
  //boolean variable if cross
  bool isCross = true;
  String message;
  List<String> gameState;

  //TODO: initialize the a 3 x 3 array with empty spaces
  @override
  void initState(){
    super.initState();
    setState(() {
     gameState = [
       'empty',
       'empty',
       'empty',
       'empty',
       'empty',
       'empty',
       'empty',
       'empty',
       'empty'
     ] ;
     this.message = '';
    });
  }
  
  //TODO: playgame method

  playGame(int index){
    //initial state of the grid value
    if (this.gameState[index] == 'empty'){
      setState(() {
       //on change if the grid value is 'cross' 
       if(this.isCross){
         this.gameState[index] = 'cross';
         this.isCross = false;
       } else {
         this.gameState[index] = 'circle';
         this.isCross = true;
       }
       //after every move or change state it will check whether someone has won or not.
       this.checkWin();
      });
    }
  }




  //TODO: Reset Game Method
    resetGame(){
      setState(() {
       this.gameState = [
         'empty',
         'empty',
         'empty',
         'empty',
         'empty',
         'empty',
         'empty',
         'empty',
         'empty'
       ]; 
       this.message = '';
       

      });
    }

  //TODO: Get Image Method

  AssetImage getImage(String value){
    switch (value) {
    case('empty'):
      return edit;
      break;
    case('cross'):
      return cross;
      break;
    case('circle'):
      return circle;  
      break;
    }  
  
  }
  
  
  
  
  //TODO: Check for win Logic
  checkWin(){

    //horizontal game winning state check
    if((gameState[0] != 'empty')&&(gameState[0] == gameState[1])&&(gameState[1]==gameState[2])){
      this.message = '${gameState[0]} wins!*****';
      Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );}
      
    else if ((gameState[3] != 'empty')&&(gameState[3] == gameState[4])&&(gameState[4]==gameState[5])){
      this.message = '${gameState[3]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } else if ((gameState[6] != 'empty')&&(gameState[6] == gameState[7])&&(gameState[7]==gameState[8])){
      this.message = '${gameState[6]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } 
    //Vertical game winning state check 
      else if ((gameState[0] != 'empty')&&(gameState[0] == gameState[3])&&(gameState[3]==gameState[6])){
      this.message = '${gameState[0]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } else if ((gameState[1] != 'empty')&&(gameState[1] == gameState[4])&&(gameState[4]==gameState[7])){
      this.message = '${gameState[1]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } else if ((gameState[2] != 'empty')&&(gameState[2] == gameState[5])&&(gameState[5]==gameState[8])){
      this.message = '${gameState[2]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } 
    // diagonal game winning state check
      else if ((gameState[0] != 'empty')&&(gameState[0] == gameState[4])&&(gameState[4]==gameState[8])){
      this.message = '${gameState[0]} wins!*****';
      Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } else if ((gameState[2] != 'empty')&&(gameState[2] == gameState[4])&&(gameState[4]==gameState[6])){
      this.message = '${gameState[2]} wins!*****';
       Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
    } 
    // check if the game is draw
      else if(!gameState.contains('empty')){
        this.message = 'Game Draw!';
         Future.delayed(const Duration(seconds: 5),() {
        resetGame();
      },
      );
      }
    //Duration(seconds: 5);
    //resetGame();
  }
  // TODO: desiging of the app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe Game'),  
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(5.0),
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,

              child: MaterialButton(
               
               onPressed: (){
               this.playGame(i);
              },

                child: Image(
                  image: this.getImage(this.gameState[i],
                    ),),
                ),
            ),
          )
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(this.message,
          style: TextStyle(
            fontSize: 20.0, 
            fontWeight: FontWeight.bold)
          )
        ),
        MaterialButton(
            onPressed: (){
              resetGame();
              },
            color: Colors.blueAccent,
            minWidth: 300,
            height: 50.0,
            child: Text('Reset Game',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold

            ),),

          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Made by Ehsan Ansari',
            style: TextStyle(
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
              color: Colors.blueAccent),

            ),

          )

        ],
      )
    );
  }
}