
class Matriz

	def initialize(filas, columnas)
    		@filas, @columnas = filas , columnas
  	end

	#Getters
	def filas()
		@filas
	end
	
	def columnas()
		@columnas
	end

	#Constructor con valores
  	def Matriz.constructor(filas, columnas, valores)
      	tamanio = filas * columnas
		if (((valores.count(0)*100)/(tamanio)) >= 60)
			MatrizDispersa.new(filas,columnas,valores)
      	else 
        	MatrizDensa.new(filas,columnas,valores)
      	end
  	end
	
  	def +(other)
		raise ArgumentError, "No tienen las mismas dimensiones " unless @filas == other.filas && @columnas == other.columnas
		matriz_suma = Array.new
		for i in 0...@filas
			for j in 0...@columnas do
				matriz_suma << (self[i,j] + other[i,j])
			end
		end
		Matriz.constructor(@filas, @columnas, matriz_suma)
    end
  
	def -(other)	
		raise ArgumentError, "No tienen las mismas dimensiones " unless @filas == other.filas && @columnas == other.columnas
		matriz_resta = Array.new
		for i in 0...@filas do
			for j in 0...@columnas do
				matriz_resta << (self[i,j] - other[i,j])
			end
      	end
		Matriz.constructor(@filas, @columnas, matriz_resta)
  	end

	def ==(other)
		if ((@filas == other.filas) && (@columnas == other.columnas))
			i = 0
			while (i < @filas) do
				j = 0
				while (j < @columnas) do
					if (self[i,j] == other[i,j]) #comparamos elemento a elemento
						return true
					else 
						return false #si solo uno es distinto la funcion devuelve falso
					end
					j = j + 1
				end
				i = i + 1
			end
		end
		return true #si compara todos los elementos y son iguales devuelve verdadero
	end 

	def *(other)
		if(other.is_a? Numeric)
			matriz_producto = Array.new
      		i=0
			while (i < @filas)
				j=0
				while (j < @columnas)
					matriz_producto << (self[i,j] * other)
					j = j+1
        		end
				i = i+1
			end
			Matriz.constructor(@filas,@columnas,matriz_producto)    
		elsif ((other.is_a?(Matriz) == true) && (@columnas == other.filas))
			i=0
            matriz_producto = Array.new
            while (i < @filas)
				j = 0
                while (j < other.columnas)
					k = 0
                    matriz_producto << 0
                    while (k < @columnas) #itera en las columnas de la primera matriz y las filas de la segunda
						matriz_producto[(matriz_producto.size)-1] = (matriz_producto.last + (self[i,k] * other[k,j]))
                        k = k + 1
                    end
                    j = j + 1
                end
				i = i + 1
			end
            Matriz.constructor(@filas,other.columnas,matriz_producto)
		end
	end
 
	def max()
		maximo = 0 
		i, j = 0,0
		while i <= @filas
			while j <= @columnas
				if (self[i,j] > maximo) 
					maximo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return maximo
	end
	
	def min()
		minimo = 0 
		i, j = 0,0
		while i <= @filas
			while j <= @columnas
				if (self[i,j] < minimo) #si el valor es mayor que el provisional almacena el nuevo
					minimo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return minimo
	end

	def to_s
		string= "[" 
		fil=0
		while (fil < @filas)
			string = string + "[" 
			col=0
			while (col<@columnas)
				string = string + "#{self[fil,col]}"
				col += 1
				if(col < @columnas)
					string = string + ","
				end
			end
			string = string + "]" 
			fil += 1
			if (fil < @filas)
				string = string + ","
			end
		end
		string = string + "]" 
	end
                     
  	def coerce(other)
    		[self,other]
  	end
end