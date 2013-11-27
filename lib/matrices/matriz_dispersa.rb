class MatrizDispersa < Matriz

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
  	
	def []= (i,j,nvalor) 
		ind = 0
		while ind < @vvalores.size
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor != 0) #para poner un nuevo valor no nulo
				@vvalor[ind]=nvalor
				return
			end
			if (i == @vfil[ind] && j == @vcol[ind] && nvalor == 0) 	#para poner un nuevo valor nulo en una posicion ocupada anteriormente
				@vvalores.delete_at(ind)								#simplemente eliminamos el valor que habia antes pues los nulos no se almacenan
				@vfil.delete_at(ind)
				@vcol.delete_at(ind)
				return
			end
			ind += 1
		end #si la posicion no existia la anyadimos con el correspondiente valor
		@vvalores << (nvalor)
		@vfil << (i)
		@vcol << (j)
	end	
end
