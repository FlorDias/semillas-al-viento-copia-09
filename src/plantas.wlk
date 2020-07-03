class Planta {
	var property anioDeObtencion
	var property altura
	
	method horasDeSolQueTolera() { return 7 }
	
	method esFuerte() { return self.horasDeSolQueTolera() > 9 }
	
	method daNuevasSemillas() { return self.esFuerte()} 
		
}

class Menta inherits Planta {
	
	override method daNuevasSemillas() { return super() and altura > 0.4}
	
	method cuantoEspacioOcupa() { return altura * 3 }
	
	method leResultaIdeal(unaParcela) { return unaParcela.superficie() > 6 }

}

class Peperina inherits Menta {
	
	override method cuantoEspacioOcupa() { return super () * 2 }
}

class Soja inherits Planta {
	
	override method horasDeSolQueTolera () { 
		if (altura < 0.3) { return 6 } 
		if (altura.between(0.3,0.8)) { return 7 } 
		else { return 12 }
	}
	
	override method daNuevasSemillas() { return  super() and anioDeObtencion > 2007 and altura.between(0.75,0.9)}	
	
	method cuantoEspacioOcupa() { return altura / 2}
	
	method leResultaIdeal (unaParcela) { return unaParcela.horasDeSol() == self.horasDeSolQueTolera() }
	
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() { return false }
	
	override method leResultaIdeal (unaParcela) { return unaParcela. cantidadMaximaDePlantasQueTolera() == 1 }
	
}

class Quinoa inherits Planta {
	var property cuantoEspacioOcupa
	
	override method horasDeSolQueTolera () { return if (cuantoEspacioOcupa < 0.3) { 10 } else { 7 }}
		
	override method daNuevasSemillas() { return super () and anioDeObtencion < 2005 }
	
	method leResultaIdeal(unaParcela) { unaParcela.plantas().all ({ planta => planta.altura() > 1.5 })}
	
}

