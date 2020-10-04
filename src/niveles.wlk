import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.gravedad()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		//config.gravedad()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({pepita.irA(pepita.position().down(1))})
		keyboard.o().onPressDo({pepita.irA(game.origin())})
		keyboard.c().onPressDo({pepita.come(game.uniqueCollider(pepita))})
	}
	
	method gravedad(){
		game.onTick(800,"GRAVEDAD",{pepita.caer(1)})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}
	
	method ganar(){
		game.say(pepita,"GANÉ")
		game.onTick(2000,"GANAR",{game.stop()})
	}
	
	method perder(){
		game.say(pepita,"PERDI")
		game.onTick(2000,"PERDER",{game.stop()})
	}

}

