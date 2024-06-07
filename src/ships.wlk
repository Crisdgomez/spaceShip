import wollok.game.*
import weapons.*

object mainShip {

	var image = "Main Ship - Base - Full health.png"
	var position = game.at(0, 0)

	method image() = image

	method position() = position

	method position(nuevaPosicion) {
		position = nuevaPosicion
	}

	method disparar() {
		const unLaser = new Laser(position = game.at(position.x(), position.y() + 1.5))
		game.addVisual(unLaser)
		unLaser.mover()
	}

}

object motherShip {

	var image = "motherShip.png"
	var position = game.at(18, 16)

	method image() = image

	method position() = position

	method position(nuevaPosicion) {
		position = nuevaPosicion
	}

}

class EnemyShip {

	var property position
	var image = "soldier.png"

	method image() = image

	method image(nuevaImagen) {
		image = nuevaImagen
	}

	method position() = position

	method moverDerecha() {
		position = game.at(position.x() + 2, position.y())
	}

	method moverIzquierda() {
		position = game.at(position.x() - 1, position.y())
	}

	method moverPosInicial() {
		position = game.at(position.x() - 2, position.y())
	}

	method explotar() {
		game.schedule(2000, { self.image("explosion-soldado.png")})
	}

	method desaparecer() {
		game.schedule(6000, { game.removeVisual(self)})
	}

	method impactoLaser() {
		self.explotar()
		self.desaparecer()
	}

}

