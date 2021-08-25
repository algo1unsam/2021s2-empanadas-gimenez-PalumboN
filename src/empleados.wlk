// SOLUCIÓN QUE PRE-CALCULA LA DEUDA Y EL DINERO

//object galvan {
//    var sueldo = 15000
//    var dinero = 0
//    var deuda = 0
//
//    method sueldo() { return sueldo }
//
//    method deuda()  { return deuda  }
//
//    method dinero() { return dinero }
//
//    method sueldo(valor) { sueldo = valor }
//
//    method dinero(valor) { dinero = valor }
//
//    method deuda(valor)  { deuda = valor  }
//
//    method cobrarSueldo() {
//        if (self.sueldo() > self.deuda()) {
//            const excedente = self.sueldo() - self.deuda()
//            const totalDinero = excedente + self.dinero()
//            self.dinero(totalDinero)
//            self.deuda(0)
//        } else {
//            const deudaDisminuida = self.deuda() - self.sueldo()
//            self.deuda(deudaDisminuida)
//        }
//    }
//
//    method gastar(cuanto) {
//        if (cuanto > self.dinero()) {
//            const nuevaDeuda = self.deuda() + (cuanto - self.dinero())
//            self.deuda(nuevaDeuda)
//            self.dinero(0)
//        } else {
//            const dineroDisminuido = self.dinero() - cuanto
//            self.dinero(dineroDisminuido)
//        }
//    }
//
//}

// SOLUCIÓN QUE POST-CALCULA LA DEUDA Y EL DINERO A PARTIR DE UN BALANCE
object galvan {
    var sueldo = 15000
    var balance = 0
    
    method sueldo() { return sueldo }
    method sueldo(nuevoValor) { sueldo = nuevoValor }
    
    method cobrarSueldo(){
        balance += sueldo
    }
    method gastar(cuanto){
        balance -= cuanto
    }
    
    method totalDeuda(){
        return balance.min(0).abs()
    }
    method totalDinero(){
        return balance.max(0)
    }
}



object baigorria {
	var cantidadEmpanadasVendidas = 0
	const montoPorEmpanada = 15
//	var sueldo = 0 // ¿Se guarda o se calcula? - PRECALCULAS vs CALCULAR EN EL MOMENTO
	var totalCobrado = 0

	method venderEmpanadas(cuantas) {
		cantidadEmpanadasVendidas += cuantas
	}

	method sueldo() { return cantidadEmpanadasVendidas * montoPorEmpanada }
	
	method cobrarSueldo() {
		totalCobrado += self.sueldo()
		cantidadEmpanadasVendidas = 0
	}
	
	method totalCobrado() { return totalCobrado }
}

object gimenez {
	var dinero = 300000

	method dinero() { return dinero	}

	method pagarA(empleado) {
		// A Gimenez no le importa cuál es el empleado (ni su forma de calcular el sueldo)
		// los trata a todxs de la misma manera
		// Eso es POLIMORFISMO
		dinero -= empleado.sueldo()
		empleado.cobrarSueldo()
	}
}

// Qué forma tienen los objetos de conocer a otros
// 1) Por atributo
// 2) Por parámetro
// 3) De manera global (hardcodeado)
// 4) Pidiendoselo a otro objeto


