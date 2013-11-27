
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
	
	#Método suma
  	def +(other)
		raise ArgumentError, "No tienen las mismas dimensiones " unless @filas == other.filas && @columnas == other.columnas
		matriz_suma = Array.new
		@filas.times do |i|
			@columnas.times do |j|
				matriz_suma << (self[i,j] + other[i,j])
			end
		end
		Matriz.constructor(@filas, @columnas, matriz_suma)
    end
  
	#Método resta
	def -(other)	
		raise ArgumentError, "No tienen las mismas dimensiones " unless @filas == other.filas && @columnas == other.columnas
		matriz_resta = Array.new
		@filas.times do |i|
			@columnas.times do |j|
				matriz_resta << (self[i,j] - other[i,j])
			end
      	end
		Matriz.constructor(@filas, @columnas, matriz_resta)
  	end

	#Método producto
	def *(other)
		if(other.is_a? Numeric)
			matriz_producto = Array.new
			@filas.times do |i|
				@columnas.times do |j|
					matriz_producto << (self[i,j] * other)		
        			end
			end
		        Matriz.constructor(@filas,@columnas,matriz_producto)    
		elsif ((other.is_a?(Matriz) == true) && (@columnas == other.filas))
            		matriz_producto = Array.new
			@filas.times do |i|
				other.columnas.times do |j|
					matriz_producto << 0
		            @columnas.times do |k|
						matriz_producto[(matriz_producto.size)-1] = (matriz_producto.last + (self[i,k] * other[k,j]))
		            end
		        end
			end
            Matriz.constructor(@filas,other.columnas,matriz_producto)
		end
	end

	#Método de comparación
 	def ==(other)
		if ((@filas == other.filas) && (@columnas == other.columnas))
			i = 0
			@filas.times do |i|
				@columnas.times do |j|
					if (self[i,j] == other[i,j]) 
						return true
					else 
						return false 
					end
				end
			end
		end
		return true 
	end 

	#Métodos máximo y mínimo
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

	#Método to_s para mostrar la matriz como cadena de caracteres
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
    
    #Método para la conversión de tipo                 
  	def coerce(other)
    		[self,other]
  	end
end
