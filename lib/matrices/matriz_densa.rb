#Clase MatrizDensa, hereda de la clase Matriz
class MatrizDensa < Matriz
	
	def initialize(filas, columnas, velementos)
   		super(filas, columnas)
		@matriz = Array.new(velementos)
  	end
  
  	def pos(i,j)
    		 (i * @columnas) + j
 	end
  
	#Método de acceso a los elementos de la matriz
  	def [](i,j)
    		 @matriz[pos(i,j)]
  	end
  
	#Método para asignar valores a los elementos de la matriz
  	def []= (i,j,valor)
    		 @matriz[pos(i,j)] = valor
  	end
end
