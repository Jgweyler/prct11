#Fichero para el desarrollo de la clase Fraccion
	
class Fraccion 

	include Comparable		#Incluimos el módulo Comparable.

	def initialize(num, den) 	#método para inicializar las variables
		divisor = gcd(num, den) #obtenemos el gcd entre numerador y denominador para simplificar
		@num = num/divisor
		@den = den/divisor
	end

	#Getters
	def num()
		@num
	end

	def denom()
		@den
	end
    
	#Conversión a string
	def to_s()
		"#{@num}/#{@den}"
	end 
    
 	#Conversión a flotante
	def to_float()
		@num/@den
	end

	#Valor absoluto. 
	def abs()
		Fraccion.new(@num.abs, @den.abs)
	end
    
	#Recíproco. Calcula la recíproca de una fracción.
	def reciprocal()
		Fraccion.new(@den,@num)
	end

	#Opuesto. Se obtiene el opuesto de una fracción
	
	def -@()
		Fraccion.new(-@num, @den)
	end

	#Resto. Obtenemos el resto entre dos fracciones.
	def %(other)
		((@num * other.denom) % (@den * other.num))	
	end
    
    #Suma. Se pasa un objeto como parámetro
	def +(other)
		if (other.instance_of?(Fixnum) == true)
			other = Fraccion.new(other,1)
		end
		aux = mcm(@den, other.denom)           #mcm de los denominadores
                Fraccion.new(((aux/@den)*@num)+((aux/other.denom)*other.num),aux) #suma de los objetos 
	end
    
	#Resta. Se pasa un objeto como parámetro
	def -(other)
		if (other.class == Fixnum)
			other = Fraccion.new(other,1)
		end
		aux = mcm(@den, other.denom)           #mcm de los denominadores
                Fraccion.new(((aux/@den)*@num)-((aux/other.denom)*other.num),aux) #resta de los objetos
	end   
    
    #Producto. Se pasa un objeto como parámetro
	def *(other)
		if (other.is_a?(Numeric))
			other = Fraccion.new(other,1)
		end
		Fraccion.new(@num*other.num, @den*other.denom)	
	end

	#División. Se pasa un objeto como parámetro
	def /(other)
		Fraccion.new(@num*other.denom, @den*other.num)	
	end
     
	#Definimos el método que nos va a permitir hacer las comparaciones entre fracciones.
	def <=> (other)
		return nil unless other.instance_of? Fraccion  #Comprobamos que 'other' es una instancia de Fraccion y
		(@num * other.denom) <=> (@den * other.num)    #por lo tanto se puede comparar con un objeto de la misma clase.
	end
	
	#Métodos auxiliares
	#Máximo común divisor
	def gcd(u, v)
		while v != 0
			u, v = v, u % v
		end
		u
	end
     
    #Mínimo común múltiplo 
	def mcm(u, v)                #método Mínimo Común Múltiplo
		(u/gcd(u,v))*v        #uso del máx. común divisor para hallarlo        
	end

	#Método coerce para la conversión de tipo
  	def coerce(other)
    		[self,other]
  	end
end
