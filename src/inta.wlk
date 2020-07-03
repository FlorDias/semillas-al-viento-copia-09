import plantas.*
import parcelas.*

object inta {
	var property parcelas = #{}
	
	method agregarParcela (parcela) { parcelas.add (parcela)}
	
	method promedioDePlantas() { return parcelas.sum({parcela=> parcela.plantas().size()}) / parcelas.size()}

	method masAutosustentable() { return self.parcelasConMasDeCuatroPlantas().find({planta => self.mayorPorcentajeBienAsociadas(planta) })}
	
	method parcelasConMasDeCuatroPlantas() { return parcelas.filter({parcela => parcela.plantas().size() > 4 })}
	
	method mayorPorcentajeBienAsociadas(unaPlanta) { self.parcelasConMasDeCuatroPlantas().max({parcela => parcela.seAsociaBien(unaPlanta)})}

}
