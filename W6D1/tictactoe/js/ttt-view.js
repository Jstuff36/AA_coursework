class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  bindEvents() {
    $('li').on("click", (event) => {
      this.makeMove($(event.currentTarget));
    });
  }

  unbindEvents() {
    $('li').off("click");
  }

  gameOver() {
    let $h1 = $("<h1></h1>").text(`You win ${this.game.winner()}!`);
    this.$el.after($h1);
    this.unbindEvents();
  }

  makeMove($square) {
    if ($square.text() === "") {
      $square.text(this.game.currentPlayer);
      $square.removeClass("unselected");
      $square.addClass("selected");
      this.game.playMove($square.data("pos"));
      if (this.game.winner()) {
        this.gameOver();
      }
    } else {
      alert("Cant move there");
    }
  }

  setupBoard() {
    let $ul = $("<ul class='grid'></ul>");
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $square = $("<li class='gridSquare unselected'></li>");
        $square.data("pos", [row, col]);
        $ul.append($square);
      }
    }
    this.$el.append($ul);
    this.bindEvents();
  }
}

module.exports = View;
