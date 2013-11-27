require 'matrices.rb'

describe Matriz do

	before :each do
		@mdensa1 = Matriz.constructor(2,2,[1,1,2,2])
		@mdensa2 = Matriz.constructor(2,2,[2,2,4,4])
		
		@mdisp1 = Matriz.constructor(2,2,[2,0,0,0])
		@mdisp2 = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mdisp3 = Matriz.constructor(3,3,[0,0,0,0,0,2,0,0,0])
			
		@rac1 = Fraccion.new(1,2)
		@rac2 = Fraccion.new(3,4)
		@rac3 = Fraccion.new(5,6)
		@rac4 = Fraccion.new(7,8)
		@rac5 = Fraccion.new(11,8)
		@rac6 = Fraccion.new(19,12)
		
		@mfrac1 = Matriz.constructor(2,2,[@rac1,@rac2,@rac3,@rac4])
		@mfrac2 = Matriz.constructor(2,2,[@rac4, @rac3, @rac2, @rac1])	
	end
	
	describe "# Almacenamiento " do
		it "Almacenamiento de las matrices y acceso con [] " do
			@mdensa1[0,0].should eq(1)
			@mdisp3[1,2].should eq(2) 
			@mfrac1[0,0].should eq(@rac1)
		end
	end


	describe "# Operaciones aritmeticas " do
		describe "#Suma de matrices " do
			it "Suma de matrices con fracciones " do
				#suma de fraccionarias
				(@mfrac1 + @mfrac2).to_s.should == ('[[11/8,19/12],[19/12,11/8]]')	
				
				#fraccionaria + densa
				(@mfrac1 + @mdensa2).to_s.should == ('[[5/2,11/4],[29/6,39/8]]')	
				
				#fraccionaria + dispersa
				(@mfrac1 + @mdisp1).to_s.should ==('[[5/2,3/4],[5/6,7/8]]') 
			end
			
			it "Suma de matrices densas " do
				(@mdensa1 + @mdensa1).should == @mdensa2 
			end
			
			it "Suma de matrices dispersas " do
				(@mdisp2 + @mdisp2).should == @mdisp3
			end
		end
		
		describe "# Resta de matrices " do
			it "Resta de matrices " do
				#densas
				(@mdensa2 -@mdensa1).should eq(@mdensa1)
				
				#dispersas
				(@mdisp3 - @mdisp2).should eq(@mdisp2)
			end
		end
		
		describe "#Producto de matrices " do
			it "Producto de matrices "do
				#escalar * densa
				(2 * @mdensa1).should == @mdensa2
				
				#densa * fraccionaria
				(@mdensa1 * @mfrac1).to_s.should == ('[[4/3,13/8],[8/3,13/4]]') 
				
				#fraccionaria * dispersa
				(@mfrac1 * @mdisp1).to_s.should == ('[[1/1,0/1],[5/3,0/1]]')
				
				#fraccionaria * fraccionaria
				(@mfrac1 * @mfrac1).to_s.should == ('[[7/8,33/32],[55/48,89/64]]')
				
				#dispersa * dispersa
				(@mdisp2 * @mdisp3).to_s.should ==('[[0,0,0],[0,0,0],[0,0,0]]')
			end
		end
	end
	
	describe "# Comprobacion de tipo " do
		it "Clase de los objetos " do
			@mdisp2.instance_of?(MatrizDispersa)
			@mdensa1.instance_of?(MatrizDensa)
		end
	end
	
	describe "# Otras operaciones " do		
		it "Maximo " do
			@mdensa2.max.should == 4
		end
	end
end

