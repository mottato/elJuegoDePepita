import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if(self.estaConSilvestre() || self.estaCansada())
		"pepita-gris.png"
		else if (self.estaEnElNido()) 
		"pepita-grande.png"
		 else 
		"pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaCansada()){
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		} if(self.estaCansada()){
			game.stop()
		}
		
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	method estaConSilvestre()= position == silvestre.position()
	method caer(altura){
		position= game.at(position.x(),0.max(position.y() - altura))
	}

}

