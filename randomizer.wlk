import wollok.game.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0.. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method emptyPosition() {
    /*  Hay que tener cuidado con este método, porque generaría un bucle si todo el
        tablero estuviera lleno en todas las celdas. */
        
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
}