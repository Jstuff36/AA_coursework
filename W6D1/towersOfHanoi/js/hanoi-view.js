class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.clickListeners();
    this.render();
  }

  clickListeners() {
    $("ul").on("click", () => {
      if (this.firstClick !== undefined) {
        this.secondClick = $(event.currentTarget).data("tower");
        console.log("Second: " + this.secondClick);
        this.game.move(this.firstClick, this.secondClick);

        console.log(this.game.towers);

        this.firstClick = undefined;
        this.render();
      } else {
        this.firstClick = $(event.currentTarget).data("tower");
        console.log("First: " + this.firstClick);
        console.dir(this);
      }
    });
  }

  clearListeners() {
    $("ul").off("click");
  }

  setupTowers() {
    this.$el.append($('<ul class="tower">').data("tower", 0));
    this.$el.append($('<ul class="tower">').data("tower", 1));
    this.$el.append($('<ul class="tower">').data("tower", 2));
  }

  render() {
    let towers = this.game.towers;
    let $uls = $('ul');
    $('li').remove();

    for (let i = 0; i < 3; i++) {
      for (let j = towers[i].length - 1; j >= 0; j--) {
        $($uls[i]).append(`<li class="size-${towers[i][j]}"></li>`);
      }
    }

    if (this.game.isWon()) {
      this.clearListeners();
      alert("You won!");
    }

  }

}

module.exports = View;
