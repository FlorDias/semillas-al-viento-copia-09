class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	var property plantas = #{}
	
	method agregarPlanta(planta) { plantas.add (planta)}
	
	method sacarPlanta(planta) { plantas.remove (planta)}
	
	method superficie() { return ancho * largo }
	
	method cantidadMaximaDePlantasQueTolera() { return if (largo > 3 ){ largo + 4 } else { self.superficie() / 2}}

	method tieneSangreJoven() { return plantas.any ({ planta => planta.anioDeObtencion() > 2012 })}
	
	method plantarUnaPlanta(planta) { 
			if(self.puedePlantar(planta)){
				self.agregarPlanta(planta)
			} else { self.error ("No puedo plantar")}
	}

	method puedePlantar (planta) { 
		
		return self.cantidadMaximaDePlantasQueTolera() < self.unaMas() and
		planta.horasDeSolQueTolera() < self.recibeDosHorasMasDeSol()
	}

	method unaMas() { return self.cantidadMaximaDePlantasQueTolera() + 1 }

	method recibeDosHorasMasDeSol() { return horasDeSol + 2 } 
	
}
	
class ParcelaEcologica inherits Parcela {
		
	method seAsociaBien (unaPlanta) { return self.tieneSangreJoven() and unaPlanta.leResultaIdeal() }
	
}

class ParcelaIndustrial inherits Parcela {
	
	method seAsociaBien(unaPlanta) { return plantas.size() >= 2 and unaPlanta.esFuerte()}

}


