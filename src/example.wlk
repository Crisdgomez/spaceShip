import wollok.game.*
import ships.*

object juego {

	method configurar() {
		game.cellSize(32)
		game.height(20)
		game.width(32)
		game.title("Juego")
		game.boardGround("spaceBG.jpg")
		keyboard.space().onPressDo{ mainShip.disparar()}
	}

	method iniciar() {
		const filaSoldados = [ new EnemyShip(position=game.at(6,13)), new EnemyShip(position=game.at(9,13)), new EnemyShip(position=game.at(12,13)), new EnemyShip(position=game.at(15,13)), new EnemyShip(position=game.at(18,13)), new EnemyShip(position=game.at(21,13)) ]
		game.addVisualCharacter(mainShip)
		game.addVisual(motherShip)
		filaSoldados.forEach{ soldier =>
			game.addVisual(soldier)
			game.onTick(1500, "moverSoldadoDer", { soldier.moverDerecha()})
			game.onTick(750, "moverSoldadoIzq", { soldier.moverIzquierda()})
			const randomInterval = 2000.randomUpTo(5000)
			game.onTick(randomInterval, "enemyFire" + soldier.toString(), { soldier.disparar()})
		}
		game.start()
	}

}

