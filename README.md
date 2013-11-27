Práctica 11
==============================================================

Introducción
------------

Considerando el desarrollo de la gema para la representación de matrices (_prácticas anteriores_), se deberá documentar, usando la herramienta **RDoc** y además, se debe desarrollar los métodos de `suma` y `producto` de matrices, siguiendo la filosofía de la programación funcional. 
Vamos a trabajar con integración continua, con la herramienta **Travis** y seguimiento continuo de las pruebas, gracias a **Guard**. Usaremos pruebas unitarias **Unit Testing** y expectativas(**TDD**).

Documentación
------------

La organización de los ficheros y directorios en esta práctica es la siguiente:

```
/prct11
	Rakefile
	Guardfile
	Gemfile	
	.travis.yml
	.gitignore
	LICENSE.txt
	matrices.gemspec
	/spec
		matrices_spec.rb
		fraccion_spec.rb
	/lib
		matrices.rb
		/matrices
			fraccion.rb
			matriz.rb
			matriz_densa.rb
			matriz_dispersa.rb
			version.rb
	/test
		tc_matrices.rb
	/doc
		(... ficheros generados de documentación)
		
```
Componentes
------------

* Sara Báez García
* Jorge Gómez Weyler
