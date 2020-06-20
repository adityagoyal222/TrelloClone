class Board{

  String boardName;

  Board({ this.boardName });

  Board.fromJson(Map<String, dynamic> parsedJSON) : boardName = parsedJSON['name'];
  
}

class Lists{

  String listName;

  Lists({ this.listName });

  Lists.fromJson(Map<String, dynamic> parsedJSON) : listName = parsedJSON['name'];
}

class Cards{

  String cardName;

  Cards({ this.cardName });

  Cards.fromJson(Map<String, dynamic> parsedJSON) : cardName = parsedJSON['name'];
}

