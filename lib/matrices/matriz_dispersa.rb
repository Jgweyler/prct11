#Clase MatrizDispersa, hereda de la clase Matriz. 
class MatrizDispersa < Matriz

	#Invalidamos el método initialize de la super clase
	#para poder crear matrices dispersas
	def initialize(filas, columnas, velementos)
    	super(filas, columnas)
        @vvalores= Array.new 
        @vfil= Array.new
        @vcol = Array.new
		longitud=(@filas*@columnas)
		i=0
		while(i < longitud)
      		if(velementos[i]!=0)
        		@vvalores<< (velementos[i])
        		@vfil << (i/@columnas)
       			@vcol<< (i%@columnas)
			end
			i=i+1
		end
	end

	#Método para el acceso a los elementos de la matriz
	def [](fil,col)
		no_nulo = @vvalores.size
		i=0
		while(i < no_nulo)
			if (@vfil[i] == fil && @vcol[i] == col)
				return @vvalores[i]
       		end
			i=i+1
     	end
     	return 0 
  	end
  	
  	#Método para la asignación de valores a los elementos de la matriz
	def []= (i,j,nvalor) 
		ind = 0
		while ind < @vvalores.size
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor != 0) 
				@vvalor[ind]=nvalor
				return
			end
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor == 0)
				@vvalores.delete_at(ind)							
				@vfil.delete_at(ind)
				@vcol.delete_at(ind)
				return
			end
			ind += 1
		end 
		@vvalores << (nvalor)
		@vfil << (i)
		@vcol << (j)
	end	
end
