
class Viajes inherits ActividadQueOfrecen {
	const property idiomas = #{}
	
	method esInteresante() = idiomas.size() > 1
	
}

class ActividadQueOfrecen {
   
	method esfuerzoQueImplica() 
	method sePuedeBroncear()
	method diasQueLleva()
}


class ViajesDePLaya inherits Viajes {
	var largoDePlaya = 0
	override method  diasQueLleva() = largoDePlaya / 500
	override method esfuerzoQueImplica() = largoDePlaya > 1200
	override method sePuedeBroncear() = true
	
}

class ExcursionACiudad inherits Viajes {
  var atracciones 
  
  override method  diasQueLleva() = atracciones / 2
  override method esfuerzoQueImplica() =  atracciones.between(5,8)
  override method sePuedeBroncear() = false
  override method esInteresante() = super() or atracciones == 5
  
}

class ExcursionTropical  inherits ExcursionACiudad {
	override method  diasQueLleva() = super() + 1
	 override method sePuedeBroncear() = true
}

class SalidaATrekking inherits Viajes {
	var kilometros 
	var diasDeSol 
	
	override method  diasQueLleva() = kilometros / 50
	override method esfuerzoQueImplica() = kilometros > 80
	override method sePuedeBroncear() = diasDeSol > 200 or (diasDeSol.between(100,200) and kilometros  > 120)
	 override method esInteresante() = super() and diasDeSol > 140

}


class ClaseDeGim inherits ActividadQueOfrecen {
	const property idiomas = #{"espaniol"}
	
	override method diasQueLleva() = 1
	override method esfuerzoQueImplica() = true
	override method sePuedeBroncear() = false
}

class Socio {
	
	const actividades = []
	const actividadesForzadas = []
	const idiomas = #{}
	var maximoDeActividades 
	const property edad
	
	method esAdoradorDeSol() = actividades.all({a => a.sePuedeBroncear()})
	
	method actividadesForzadas() = actividadesForzadas.filter({a => a.esfuerzoQueImplica()})
	
	method realizaActividad(unaActividad) = 
	if(actividades.size() < maximoDeActividades) actividades.add(unaActividad)
	else self.error("no puede realizar actividad")
	
	method atraeActividad(unaActividad) 
	
	
	
	
}

class Tranquilo inherits Socio {
	override method atraeActividad(unaActividad) = unaActividad.diasQueLleva() >= 4
	
}

class Coherente inherits Socio {
	
	override method atraeActividad(unaActividad) = 
	if(self.esAdoradorDeSol()) unaActividad.sePuedeBroncear() 
	else unaActividad.esfuerzoQueImplica()
	
}

class Relajado inherits Socio {
	
	override method atraeActividad(unaActividad) = unaActividad.idiomas().intersection(idiomas).size() >=  1
	
}
