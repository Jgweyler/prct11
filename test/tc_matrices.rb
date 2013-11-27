require 'matrices'
require 'test/unit'

class Test_Matrices < Test::Unit::TestCase
	def setup
		#matrices densas
    	@mdensa1 = Matriz.constructor(2,2,[1,1,2,2])
		@mdensa2 = Matriz.constructor(2,2,[2,2,4,4])
		@mdensa3 = Matriz.constructor(3,3,[1,1,1,2,2,2,3,3,3])
		
		#matrices dispersas
		@mdisp1 = Matriz.constructor(3,3,[1,2,3,0,0,0,0,0,4])
		@mdisp2 = Matriz.constructor(3,3,[2,4,0,0,0,0,2,0,0])
		@mdisp3 = Matriz.constructor(3,3,[3,6,3,0,0,0,2,0,4])
		
		#numeros racionales
		@rac1 = Fraccion.new(1,2)
		@rac2 = Fraccion.new(3,4)
		@rac3 = Fraccion.new(5,6)
		@rac4 = Fraccion.new(7,8)
		@rac5 = Fraccion.new(11,8)
		@rac6 = Fraccion.new(19,12)

		#matrices con fracciones
		@mfrac1 = Matriz.constructor(2,2, [@rac1,@rac2,@rac3,@rac4])
		@mfrac2 = Matriz.constructor(2,2,[@rac4, @rac3, @rac2, @rac1])
		@mfrac3 = Matriz.constructor(2,2,[@rac5,@rac6,@rac6,@rac5])
		@mfrac4 = Matriz.constructor(3,3,[@rac5,@rac6,@rac6,@rac5,@rac3,@rac2,@rac3,@rac2,@rac1])
  	end
  
	def test_fracciones
		assert_equal("1/2", @rac1.to_s)
		assert_equal("3/4", @rac2.to_s)
		assert_not_equal("5/3", @rac3.to_s)
	end
  	
  	def test_dispersas
		assert_equal(@mdisp3, (@mdisp2 + @mdisp1))		#suma
		assert_equal(@mdisp1, (@mdisp3 - @mdisp2))  	#resta
		assert_equal((@mdisp1 * @mdisp2).to_s,('[[8,4,0],[0,0,0],[8,0,0]]'))
  	end
  	
  	def test_densas
		assert_equal(@mdensa2,(@mdensa1 + @mdensa1))		#suma
   		assert_equal(@mdensa1, (@mdensa2 - @mdensa1))		#resta
		assert_equal((@mdensa1 * @mdensa2).to_s,('[[6,6],[12,12]]'))		
  	end
  	
  	def test_fraccionarias
		assert_equal(@mfrac3,(@mfrac1 + @mfrac2))
		assert_equal(@mfrac1, (@mfrac3 - @mfrac2))
  	end

  	def test_producto
    		#dispersa * densa
    		assert_equal((@mdisp1 * @mdensa3).to_s,('[[14,14,14],[0,0,0],[12,12,12]]'))
    		
    		#dispersa * fraccionaria
    		assert_equal((@mdisp2 * @mfrac4).to_s,('[[33/4,13/2,37/6],[0/1,0/1,0/1],[11/4,19/6,19/6]]'))
    		
    		#densa * fraccionaria
	        assert_equal((@mdensa1 * @mfrac1).to_s,('[[4/3,13/8],[8/3,13/4]]')) 
  	end

  	def test_failure
    		assert_equal(@mfrac3,(@mfrac1 + @mfrac2))
  	end
    
	def test_max_min
		assert_equal(@mdisp1.max,3)
	end
	
  	def tear_down
    		#nothing
  	end
end
