class MatrizDensa < Matriz
	def initialize(filas, columnas, velementos)
   		super(filas, columnas)
		@matriz = Array.new(velementos)
  	end
  
  	def pos(i,j)
    		 (i * @columnas) + j
 	end
  
  	def [](i,j)
    		 @matriz[pos(i,j)]
  	end
  
  	def []= (i,j,valor)
    		 @matriz[pos(i,j)] = valor
  	end
end
