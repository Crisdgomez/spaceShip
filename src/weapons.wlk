import wollok.game.*
import ships.*

class Laser {

	var property position
	const image = "laser.png"

	method position() = position

	method image() = image

	method mover(direccion) {
		game.onTick(100, "moverLaser", { position = if (direccion == "up") position.up(2) else position.down(2) })
		game.onCollideDo(self, { algo =>
			algo.impactoLaser()
			self.impacto()
		})
	}

	method impacto() {
		game.removeVisual(self)
	}

}

