
//¡¡¡¡¡¡Para utilizar este codigo necesitas hacer unas configuraciones¡¡¡¡¡¡

//(1). ir a configurar
//(2). Seleccionar: Opciones del Lenguaje(perfiles)...
//(3). Abajo a la izquierda seleccionar la opcion: Personalizar...
//(4). Marcar la casilla: Utilizar indices en arreglos y cadenas en base 0

//!LISTO YA PUEDES UTILIZAR EL CODIGO!



Funcion menu = MostrarMenu
        Escribir '----------------------'
	Escribir '----MENU PRINCIPAL----'
	Escribir '----------------------'
	Escribir '(1). Registrar estudiantes(10)'
	Escribir '(2). Asignar 3 notas parciales a cada estudiante'
	Escribir '(3). Registrar el numero de inasistencias de cada estudiante'
	Escribir '(4). Mostrar el listado de todos los estudiantes'
	Escribir '(5). Calcular nota final de los estudiantes'
	Escribir '(9). Cerrar programa'
	Leer menu
FinFuncion

//Todos los bucles terminan hasta 9, por que los pasos de 0 a 9 son 10
//Y solo se permiten crear 10 estudiantes segun las indicaciones
Funcion registro = RegistroEstudiante (listado)
	Escribir ' '
	Escribir '-------------------------------------------'
	Escribir 'Escriba los datos de sus nuevos estudiantes'
	Escribir '-------------------------------------------'
	Escribir ' '
	Para i = 0 Hasta 9 Con Paso 1 Hacer
		Escribir 'Ingrese el codigo del estudiante #', (i + 1)
		Leer codigo
		idExistente = Verdadero
		//Creamos un bucle para verificar el el ID del estudiante no se repita
		Mientras idExistente
			idExistente = Falso
			Para j = 0 Hasta i - 1 Con Paso 1 Hacer
				Si listado[j,0] == codigo Entonces
					idExistente = Verdadero
				FinSi
			FinPara
			
			si idExistente
				Escribir '----------------------------------------'
				Escribir 'El codigo que intenta ingresar ya existe'
				Escribir 'Por favor ingrese uno nuevo'
				Escribir '----------------------------------------'
				Leer codigo
			FinSi
		FinMientras
		listado[i, 0] = codigo
		
		Escribir 'Ingrese el nombre del estudiante #', (i + 1)
		Leer name
		listado[i, 1] = name
	FinPara
FinFuncion

Funcion nota = RegistrarNota (listado, notas)
	Para i = 0 Hasta 9 Con Paso 1 Hacer
		Escribir ' '
		Escribir '-------------------------------------------------------------------'
		Escribir 'Asigne las 3 notas de los parciales al estudiante: ', listado[i, 1]
		Escribir '-------------------------------------------------------------------'
		Escribir ' '
		Escribir 'Ingrese la nota del parcial #1'
		//Convertimos las notas ingresadas para poder hacer las operaciones
		Leer parcial1
		notas[i, 0] = ConvertirANumero(parcial1)
		Escribir 'Ingrese la nota del parcial #2'
		Leer parcial2
		notas[i, 1] = ConvertirANumero(parcial2)
		Escribir 'Ingrese la nota del parcial #3'
		Leer parcial3
		notas[i, 2] = ConvertirANumero(parcial3)
	FinPara
FinFuncion

Funcion inasistencias = RegistrarInasistencias (listado, notas)
        Escribir ' '
	Escribir '-------------------------------------'
	Escribir 'Ingrese el total de las inasistencias'
	Escribir '-------------------------------------'
	Escribir ' '
	Para i = 0 Hasta 9 Con Paso 1 Hacer
		Escribir 'Asigne las inasistencias del estudiante: ', listado[i, 1]
		Escribir ' '
		Leer inasistencias
		//Convertimos las inasistencias para poder hacer las operaciones
		notas[i, 3] = ConvertirANumero(inasistencias)
	FinPara
FinFuncion

Funcion lista = MostrarLista (listado)
	Escribir ' '
	Escribir '-----------------------------------------'
	Para i = 0 Hasta 9 Con Paso 1 Hacer
		Escribir '(',(i + 1),').' ' Codigo: ', listado[i, 0], '  Nombre: ', listado[i, 1]
	FinPara
	Escribir '-----------------------------------------'
	Escribir ' '
FinFuncion

Funcion calcular = CalcularNota (listado, notas)
	Escribir ' '
	Escribir '-- CODIGO -- NOMBRE -- P1 -- P2 -- P3 -- INASISTENCIAS -- NOTA FINAL --'
	para i = 0 Hasta 9 Con Paso 1 Hacer
		notas[i, 4] = (notas[i, 0] + notas[i, 1] + notas[i, 2]) / 3
		si notas[i, 3] > 10 & notas[i, 3] < 15 Entonces
			notas[i, 4] = notas[i, 4] - 0.5
		FinSi
		si notas[i, 3] > 15 Entonces
			notas[i, 4] = notas[i, 4] - 1
		FinSi
		Escribir '   ', listado[i, 0], '         ', listado[i, 1], '      ', notas[i, 0], '     ', notas[i, 1], '     ', notas[i, 2], '     ', notas[i, 3], '                ', notas[i, 4]
	FinPara
	Escribir ' '
FinFuncion
Algoritmo Estudiantes
	//Creamos unas matrizes grandes para que no salte error
	Dimension listado[100,2]
	Dimension notas[100,5]
	
	Repetir
		menu = MostrarMenu
		//Cuanto el usuario ingrese un valor fuera de lo establecido no lo deje pasar hasta que ingrese un valor correcto
		Mientras menu < 1 o (menu > 5 & menu <> 9) Hacer
			Escribir ' '
			Escribir 'El número tiene que estar entre 1 y 3'
			Escribir 'Seleccione una acción válida (9 para salir)'
			Leer menu
		FinMientras
		Segun menu Hacer
			1:
				registro = RegistroEstudiante (listado)
			2:
				nota = RegistrarNota (listado, notas)
			3:
				inasistencias = RegistrarInasistencias (listado, notas)
			4:
				lista = MostrarLista (listado)
			5: 
				calcular = CalcularNota (listado, notas)
		FinSegun
	Hasta Que menu == 9
FinAlgoritmo
