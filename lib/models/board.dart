class Board{

  String boardName;

  Board({ this.boardName });

  Board.fromJson(Map<String, dynamic> parsedJSON) : boardName = parsedJSON['name'];
  
}