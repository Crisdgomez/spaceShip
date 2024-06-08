import wollok.game.*
import weapons.*

object mainShip {

	var image = "Main Ship - Base - Full health.png"
	var position = game.at(game.width() / 2, 0)
	var property vidas = 3

	method image() = image

	method position() = position

	method position(nuevaPosicion) {
		position = nuevaPosicion
	}

	method disparar() {
		const direccion = "up"
		const unLaser = new Laser(position = game.at(position.x(), position.y() + 1.5))
		game.addVisual(unLaser)
		unLaser.mover(direccion)
	}

	method impactoLaser() {
		vidas = 0.max(vidas - 1)
		game.say(self, vidas.toString())
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

	var impactado = false
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
		self.image("explosion-soldado.png")
	}

	method desaparecer() {
		game.schedule(1000, { game.removeVisual(self)})
	}

	method impactoLaser() {
		impactado = true
		self.explotar()
		self.desaparecer()
	}

	method disparar() {
		if (!impactado) {
			const direccion = "down"
			const unLaser = new Laser(position = game.at(position.x(), position.y() - 1))
			game.addVisual(unLaser)
			unLaser.mover(direccion)
		}
	}

}

