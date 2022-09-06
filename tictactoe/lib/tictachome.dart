import 'package:flutter/material.dart';
import 'package:tictactoe/colors.dart';
import 'package:tictactoe/game_logic.dart';

class TicTacHome extends StatefulWidget {
  TicTacHome({Key? key}) : super(key: key);

  @override
  State<TicTacHome> createState() => _TicTacHomeState();
}

class _TicTacHomeState extends State<TicTacHome> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";

  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game game = Game();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's ${lastValue} turn".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardlenth ~/ 3,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(Game.boardlenth, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreboard, 3);

                                if (gameOver) {
                                  result = "$lastValue is the Winner";
                                } else if (!gameOver && turn == 9) {
                                  result = "It's a Draw!";
                                  gameOver = true;
                                }
                                if (lastValue == "X")
                                  lastValue = "O";
                                else
                                  lastValue = "X";
                              });
                            }
                          },
                    child: Container(
                      width: Game.blocSize,
                      height: Game.blocSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
               
                border: Border(bottom: BorderSide(color: Colors.black,width: 1.0))
              ),
            
              child: Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                  ),
                  primary: Color.fromARGB(255, 255, 217, 0)

                ),
                onPressed: () {
                  setState(() {
                    game.board = Game.initGameBoard();
                    lastValue = "X";
                    gameOver = false;
                    turn = 0;
                    result = "";
                    scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                  });
                },
                icon: Icon(Icons.replay,color: Colors.black,),
                label: Text("Repeat the Game",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
            
          ],
        ));
  }
}
