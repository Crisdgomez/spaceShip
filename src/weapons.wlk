import wollok.game.*
import ships.*

class Laser {

	var property position
	const image = "laser.png"

	method position() = position

	method image() = image

	method mover() {
		game.onTick(100, "moverLaser", { position = position.up(2)})
		game.onCollideDo(self, { algo =>
			algo.impactoLaser()
			self.impacto()
		})
	}

	method impacto() {
		game.removeVisual(self)
	}

}

