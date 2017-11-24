/* Desplegable del menú en versión tablet y móvil y configuracion del menú del pie
 ========================================================================== */
function desplegableMenu() {
	$('#desplegableMenu').on('click', function() {
		$('#menuCabecera').slideToggle(300);
		$('#menuCabecera').css({
			display : 'inline-block'
		});
	});
	var anchoMenuPie = $('#menuPie').width();
	var altoMenuPie = $('#menuPie').height();
	if (anchoMenuPie < 700) {
		$('#menuPie').css('padding-top', '42px');
	}
	if (altoMenuPie > 100) {
		$('#menuPie').css('padding-top', '2px');
	}
};

/* Función para desplazar el slider a la derecha
 ========================================================================== */
function moverBannerDerecha() {
	$('#botonPosterior').on('click', function() {
		$('#slider').animate({
			marginLeft : '-' + 200 + '%'
		}, 500, function() {
			$('#slider .sliderSection:first').insertAfter('#slider .sliderSection:last');
			$('#slider').css('margin-left', '-' + 100 + '%');
		});
	});
}

/* Función para desplazar el slider a la izquierda
 ========================================================================== */
function moverBannerIzquierda() {
	$('#botonAnterior').on('click', function() {
		$('#slider').animate({
			marginLeft : 0
		}, 500, function() {
			$('#slider .sliderSection:last').insertBefore('#slider .sliderSection:first');
			$('#slider').css('margin-left', '-' + 100 + '%');
		});
	});
}

/* Función para reproducir el desplazamiento del slider automáticamente
 ========================================================================== */
function reproducirBanner() {
	setInterval(function() {
		$('#slider').animate({
			marginLeft : '-' + 200 + '%'
		}, 500, function() {
			$('#slider .sliderSection:first').insertAfter('#slider .sliderSection:last');
			$('#slider').css('margin-left', '-' + 100 + '%');
		});
	}, 3000);
}

/* Función para detectar si están activas las mayúsculas
 ========================================================================== */
function isMayus(event) {
	kCode = event.keyCode ? event.keyCode : event.which;
	sKey = event.shiftKey ? event.shiftKey : ((kCode == 16) ? true : false);
	if (((kCode >= 65 && kCode <= 90) && !sKey) || ((kCode >= 97 && kCode <= 122) && sKey )) {
		$('.mayus').css('display', 'block');

	} else {
		$('.mayus').css('display', 'none');
	}
}

/* Función para obtener las fechas y horas disponsibles de tutoría
 ========================================================================== */
function disponibilidadTutorias() {
	$('#dia').change(function() {
		var diaSelec = $('#dia').val();
		var DNI = $('#DNI').val();
		$.post('obtenerFechasAJAX.php', {
			valor : diaSelec
		}, function(mensaje) {
			$('#fechas').html(mensaje);
		});
		$.post('obtenerHorasAJAX.php', {
			valor : diaSelec,
			dniProf : DNI
		}, function(mensaje) {
			$('#horas').html(mensaje);
		});
	});
}

/* Función para desplegar la lista de asignaturas que imparte un profesor
 ========================================================================== */
function desplegableAsignaturas() {
	$('.mostrarAsigs').on('click', function() {
		$('.asignaturasProf').slideToggle('slow');
	});
}

/* Función para mostrar u ocultar la opción de paginación
 ========================================================================== */
function mostrarOcultarPaginacion() {
	$('#cambiarNumPag').on('click', function() {
		$('.cambioPagina').fadeToggle();
	});
}

/* Función para mostrar u ocultar las tutorias
 ========================================================================== */
function mostrarOcultarTutorias() {
	$('#mostrarInfoTutorias').on('click', function() {
		$('.infoTutorias').fadeToggle();
	});
}

/* Funcion para mostrar u ocultar las asignaturas de un alumno
 ========================================================================== */
function mostrarOcultarAsignaturas() {
	$('#mostrarInfoAsignaturas').on('click', function() {
		$('.infoAsignaturas').fadeToggle();
	});
}

/* Funcion para mostrar u ocultar el formulario de meter un horario de tutoria
 ========================================================================== */
function mostrarOcultarFormularioMeterTutoria() {
	$('#mostrarFormHorarioTutoria').on('click', function() {
		$('.formMeterHorarioTutoria').fadeToggle();
	});
}

/* Funcion para calcular la edad según una fecha dada
 ========================================================================== */
function calcularEdad(fecha) {
		
	var values = fecha.split("/");

	var dia = values[0];

	var mes = values[1];

	var ano = values[2];

	// cogemos los valores actuales

	var fecha_hoy = new Date();

	var ahora_ano = fecha_hoy.getYear();

	var ahora_mes = fecha_hoy.getMonth() + 1;

	var ahora_dia = fecha_hoy.getDate();

	// realizamos el calculo

	var edad = (ahora_ano + 1900) - ano;

	if (ahora_mes < mes) {
		edad--;
	}

	if ((mes == ahora_mes) && (ahora_dia < dia)) {
		edad--;
	}

	if (edad > 1900) {
		edad -= 1900;
	}

	// calculamos los meses

	var meses = 0;

	if (ahora_mes > mes)

		meses = ahora_mes - mes;

	if (ahora_mes < mes)

		meses = 12 - (mes - ahora_mes);

	if (ahora_mes == mes && dia > ahora_dia)

		meses = 11;

	// calculamos los dias

	var dias = 0;

	if (ahora_dia > dia)

		dias = ahora_dia - dia;

	if (ahora_dia < dia) {

		ultimoDiaMes = new Date(ahora_ano, ahora_mes, 0);

		dias = ultimoDiaMes.getDate() - (dia - ahora_dia);

	}

	return edad;
}

/* Funcion para calcular la fortaleza de la contraseña*/

function seguridad_clave(clave){
	
   var seguridad = 0;
   if (clave.length!=0){
      if (/[0-9]/.test(clave) && /[a-zA-Z]/.test(clave)){
         seguridad += 30;
      }
      if (/[a-z]/.test(clave) && /[A_Z]/.test(clave)){
         seguridad += 30;
      }
      if (clave.length >= 4 && clave.length <= 5){
         seguridad += 10;
      }else{
         if (clave.length >= 6 && clave.length <= 8){
            seguridad += 30;
         }else{
            if (clave.length > 8){
               seguridad += 40;
            }
         }
      }
   }
   return seguridad            
} 

/*Funcion para darle color al imput según su fortaleza*/ 
function colorContraseña(){
	$("#pass").on("keyup", function(){
		
		var clave = $("#pass").val();
		if(seguridad_clave(clave)<10){
			 $("#pass").css("background-color","red");
		}else if(seguridad_clave(clave)>=10 && seguridad_clave(clave)<30){
			$("#pass").css("background-color","#ffaf7f");
		}else if(seguridad_clave(clave)>=30 && seguridad_clave(clave)<40){
			$("#pass").css("background-color","#ffc976");
		}else if(seguridad_clave(clave)>=40 && seguridad_clave(clave)<60){
			$("#pass").css("background-color","#fffd88");
		}else if(seguridad_clave(clave)>=60 && seguridad_clave(clave)<=70){
			$("#pass").css("background-color","#eff580");
		}else if(seguridad_clave(clave)>70 && seguridad_clave(clave)<=90)
			$("#pass").css("background-color","#cde762");
		else if(seguridad_clave(clave)>90 ){
			$("#pass").css("background-color","#8bff65");
		}
		
	})
}

/* Funcion para desplegar la lista de asignaturas en el formulario
 ========================================================================== */
function desplegarAsignaturas() {
	var res = $('.dac').css('top');
	$('#curso').change(function() {
		$('.asignaturas').fadeIn();
		$('.asignaturas').fadeIn('slow');
		$('.asignaturas').fadeIn(3000);
		if ($('#curso').val() == 0) {
			$('.asignaturas').fadeOut();
			$('.asignaturas').fadeOut('slow');
			$('.asignaturas').fadeOut(3000);
			$('.asigs1').slideUp('slow');
			$('.asigs2').slideUp('slow');
			$('.asigs3').slideUp('slow');
			$('.asigs4').slideUp('slow');
			$('.dac').animate({
				'top' : res
			}, 'slow');
		}
		if ($('#curso').val() == 1) {
			$('.asigs1').slideDown('slow');
			$('.asigs2').slideUp('slow');
			$('.asigs3').slideUp('slow');
			$('.asigs4').slideUp('slow');
		}
		if ($('#curso').val() == 2) {
			$('.asigs1').slideUp('slow');
			$('.asigs2').slideDown('slow');
			$('.asigs3').slideUp('slow');
			$('.asigs4').slideUp('slow');
		}
		if ($('#curso').val() == 3) {
			$('.asigs1').slideUp('slow');
			$('.asigs2').slideUp('slow');
			$('.asigs3').slideDown('slow');
			$('.asigs4').slideUp('slow');
		}
		if ($('#curso').val() == 4) {
			$('.asigs1').slideUp('slow');
			$('.asigs2').slideUp('slow');
			$('.asigs3').slideUp('slow');
			$('.asigs4').slideDown('slow');
		}
	});
}

//Funcion para calcular la letra del DNI
function letraDNI(numeroDNI) {
	var numero = numeroDNI % 23;
	var letra = "";
	switch (numero) {
		case 0:
			letra = "T";
			break;
		case 1:
			letra = "R";
			break;
		case 2:
			letra = "W";
			break;
		case 3:
			letra = "A";
			break;
		case 4:
			letra = "G";
			break;
		case 5:
			letra = "M";
			break;
		case 6:
			letra = "Y";
			break;
		case 7:
			letra = "F";
			break;
		case 8:
			letra = "P";
			break;
		case 9:
			letra = "D";
			break;
		case 10:
			letra = "X";
			break;
		case 11:
			letra = "B";
			break;
		case 12:
			letra = "N";
			break;
		case 13:
			letra = "J";
			break;
		case 14:
			letra = "Z";
			break;
		case 15:
			letra = "S";
			break;
		case 16:
			letra = "Q";
			break;
		case 17:
			letra = "V";
			break;
		case 18:
			letra = "H";
			break;
		case 19:
			letra = "L";
			break;
		case 20:
			letra = "C";
			break;
		case 21:
			letra = "K";
			break;
		case 22:
			letra = "E";
			break;

	}

	return letra;
}
/*Funcion para formatear la fecha*/
function formatearFecha(string) {
	
	if(string.indexOf("-")!=-1){
	  var fecha = string.split('-');
	  return fecha[2] + '/' + fecha[1] + '/' + fecha[0];
	 }else{
	 	return string;
	 }
 }

/* Funcion para la matriculación de un alumno
 ========================================================================== */
function matriculacion() {
	var contador = 0;

	function validaForm1() {

		var exprNumero = /^([0-9])+$/;
		var exprDNI = /[0-9]{8}[A-Z]/;
		var exprEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var exprEmailAlum = /^([a-zA-Z0-9_\.\-])+\@alum.es+$/;
		var exprFecha = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
		var exprTildes = /^[A-Za-záéíóúÁÉÍÓÚ\s]+$/;

		var nombre = document.getElementById("nombre");
		var apellidos = document.getElementById("apellidos");
		var telefono = document.getElementById("telefono");
		var dni = document.getElementById("dni");
		var email = document.getElementById("email");
		var direccion = document.getElementById("direccion");
		var provincia = document.getElementById("provincia");
		var cPostal = document.getElementById("cpostal");
		var fecha = document.getElementById("fecha");
		var hombre = document.getElementById("hombre");
		var mujer = document.getElementById("mujer");
		var esp = document.getElementById("esp");
		var eng = document.getElementById("eng");

		var numeroDNI = dni.value.substr(0, 8);
		var letra = dni.value.substr(-1);

		var resultado = true;

		if ($('#nombre').val().trim() == "") {
			nombre.setCustomValidity("Introduzca su nombre.");
			$('#nombre').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!exprTildes.test($('#nombre').val().trim())){
			nombre.setCustomValidity("Introduzca un nombre válido.");
			$('#nombre').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			nombre.setCustomValidity("");
			$('#nombre').css("background-color", "white");
		}

		if ($('#apellidos').val().trim() == '') {
			apellidos.setCustomValidity('Introduzca sus apellidos.');
			$('#apellidos').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!exprTildes.test($('#apellidos').val().trim())){
			apellidos.setCustomValidity('Introduzca unos apellidos válidos.');
			$('#apellidos').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			apellidos.setCustomValidity("");
			$('#apellidos').css("background-color", "white");
		}

		if ($('#telefono').val().trim() == '') {
			telefono.setCustomValidity('Introduzca su número de teléfono.');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprNumero.test($('#telefono').val().trim())) {
			telefono.setCustomValidity('Un número de teléfono solo puede contener números.');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($('#telefono').val().trim().length < 9) {
			telefono.setCustomValidity('Introduzca un número de teléfono correcto');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			telefono.setCustomValidity("");
			$('#telefono').css("background-color", "white");
		}

		if ($('#dni').val() == '') {
			dni.setCustomValidity('Introduzca su DNI');
			$('#dni').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!($('#dni').val().trim().length == 9) || (!exprDNI.test($('#dni').val().trim()))) {
			dni.setCustomValidity('Introduzca un DNI válido');
			$('#dni').css("background-color", "#ffeeee");
			resultado = false;
		} else if (letra != letraDNI(numeroDNI)) {
			dni.setCustomValidity('El DNI debe contener la letra adecuada');
			$('#dni').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			dni.setCustomValidity("");
			$('#dni').css("background-color", "white");
		}

		if ($('#email').val().trim() == '') {
			email.setCustomValidity('Introduzca su email.');
			$('#email').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprEmail.test($('#email').val().trim())) {
			email.setCustomValidity('Introduzca un email correcto.');
			$('#email').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprEmailAlum.test($("#email").val().trim())) {
			email.setCustomValidity("Introduzca un email acabado en @alum.es.");
			$("#email").css("background-color", "#ffeeee");
			resultado = false;
		} else {
			email.setCustomValidity("");
			$('#email').css("background-color", "white");
		}
		if ($('#hombre').attr('checked') == false && $('#mujer').attr('checked') == false) {
			hombre.setCustomValidity("Seleccione un sexo.");
			mujer.setCustomValidity("Seleccione un sexo.");
			$("#hombre").css("background-color", "#ffeeee");
			$("#mujer").css("background-color", "#ffeeee");
			resultado = false;
		} else {
			hombre.setCustomValidity("");
			mujer.setCustomValidity("");
			$('#hombre').css("background-color", "white");
			$('#mujer').css("background-color", "white");
		}
		if ($('#esp').attr('checked') == false && $('#eng').attr('checked') == false) {
			esp.setCustomValidity("Seleccione un sexo.");
			eng.setCustomValidity("Seleccione un sexo.");
			$("#esp").css("background-color", "#ffeeee");
			$("#eng").css("background-color", "#ffeeee");
			resultado = false;
		} else {
			esp.setCustomValidity("");
			eng.setCustomValidity("");
			$('#esp').css("background-color", "white");
			$('#eng').css("background-color", "white");
		}
		if ($('#direccion').val().trim() == '') {
			direccion.setCustomValidity('Introduzca su dirección');
			$('#direccion').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			direccion.setCustomValidity("");
			$('#direccion').css("background-color", "white");
		}
		if ($("#fecha").val().trim() == "") {
			fecha.setCustomValidity("Seleccione su fecha de nacimiento.");
			$("#fecha").css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprFecha.test( formatearFecha($('#fecha').val().trim()))) {
			fecha.setCustomValidity("Formato no correcto.");
			$("#fecha").css("background-color", "#ffeeee");
			resultado = false;
		}else if( calcularEdad(formatearFecha($('#fecha').val().trim())) < 0){
			fecha.setCustomValidity('La fecha debe ser anterior a la actual.');
			$('#fecha').css("background-color", "#ffeeee");
			resultado = false;
		} else if (calcularEdad(formatearFecha($('#fecha').val().trim())) < 18 ) {
			fecha.setCustomValidity("Debes ser mayor de edad.");
			$('#fecha').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			fecha.setCustomValidity("");
			$('#fecha').css("background-color", "white");
		}

		if ($("#provincia").val() != "Almería" && $("#provincia").val() != "Cádiz" && $("#provincia").val() != "Córdoba" && $("#provincia").val() != "Granada" && $("#provincia").val() != "Huelva" && $("#provincia").val() != "Jaén" && $("#provincia").val() != "Sevilla" && $("#provincia").val() != "Málaga" || $("#provincia") == "") {
			provincia.setCustomValidity('Introduzca su provincia');
			$('#provincia').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			direccion.setCustomValidity("");
			$('#provincia').css("background-color", "white");
		}

		if ($('#cpostal').val().trim() == '') {
			cPostal.setCustomValidity('Introduzca su código postal');
			$('#cpostal').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!($('#cpostal').val().trim().length == 5) || (!exprNumero.test($('#cpostal').val()))) {
			cPostal.setCustomValidity('Introduzca un código postal válido');
			$('#cpostal').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			cPostal.setCustomValidity("");
			$('#cpostal').css("background-color", "white");
		}

		return resultado;
	}

	function validaForm2() {
		
		var curso = document.getElementById("curso");
		var acceso = document.getElementById("acceso");
		var pass = document.getElementById("pass");

		var resultado = true;

		if ($('#curso').val() == '0') {
			curso.setCustomValidity('Seleccione su curso.');
			$('#curso').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			curso.setCustomValidity("");
			$('#curso').css("background-color", "white");
		}
		
		if($('input[class=asignaturasCheck]').is(':checked')){
			curso.setCustomValidity("");
			$('#curso').css("background-color", "white");
		} else{
		    curso.setCustomValidity('Seleccione al menos una asignatura.');
			$('#curso').css("background-color", "#ffeeee");
			resultado = false;
		}

		if ($('#acceso').val() == '0') {
			acceso.setCustomValidity('Seleccione su forma de acceso al grado.');
			$('#acceso').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			acceso.setCustomValidity("");
			$('#acceso').css("background-color", "white");
		}

		if ($("#pass").val() == "") {
			pass.setCustomValidity('Debes poner una contraseña.');
			$('#pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($("#pass").val().length < 8) {
			pass.setCustomValidity('La contraseña debe tener al menos 8 caracteres.');
			$('#pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!/[a-z]+/.test($("#pass").val()) || !/[A-Z]+/.test($("#pass").val()) || !/[0-9]+/.test($("#pass").val())) {
			pass.setCustomValidity('La contraseña debe incluir mayusculas, minusculas y un número.');
			$('#pass').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($("#pass").val() != $("#passConf").val()) {
			pass.setCustomValidity('La contraseña debe coincidir con la confirmacion de contraseña.');
			$('#pass').css("background-color", "#ffeeee");
			$('#passConf').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			pass.setCustomValidity('');
			$('#pass').css("background-color", "white");
			$('#passConf').css("background-color", "white");
		}

		return resultado;
	}


	$('.enviar').click(function() {

		// if(validaForm1()==false || validaForm2()==false){
		// document.location="matriculacion.php";
		// }
		validaForm1();
		validaForm2();
	})
}

/* Funcion para la comprobación al insertar un profesor
 ========================================================================== */
 
function InsertarProfesor() {
    var contador = 0;
 
    function validacionInsertarProfesor() {
        var exprDespacho = /[A-Z][0-5].[0-9][0-9]/;
        var exprDNI = /[0-9]{8}[A-Z]/;
        var exprEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var exprEmailAlum = /^([a-zA-Z0-9_\.\-])+\@([a-zA-Z0-9_\.\-])+$/;
        var edad = calcularEdad($('#fecha').val());
        var exprFecha = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
         
        var dni = document.getElementById("dni");
        var nombre = document.getElementById("nombre");
        var apellidos = document.getElementById("apellidos");
        var email = document.getElementById("email");
        var fecha = document.getElementById("fecha");
        var curso = document.getElementById("curso");
        // var modalidad  = document.getElementById("modalidad"); inecesario
        var departamento = document.getElementById("departamento");
        var despacho = document.getElementById("despacho");
        var pass = document.getElementById("pass");
        var passConf = document.getElementById("passConf");
        var asignaturas = document.getElementById("asignaturas");
        var numeroDNI = dni.value.substr(0, 8);
        var letra = dni.value.substr(-1);
 
        var resultado = true;
        //dni
        if ($('#dni').val() == '') {
            dni.setCustomValidity('Introduzca su DNI');
            $('#dni').css("background-color", "#ffeeee");
            resultado = false;
        } else if (!($('#dni').val().trim().length == 9) || (!exprDNI.test($('#dni').val().trim()))) {
            dni.setCustomValidity('Introduzca un DNI válido');
            $('#dni').css("background-color", "#ffeeee");
            resultado = false;
        } else if (letra != letraDNI(numeroDNI)) {
            dni.setCustomValidity('El DNI debe contener la letra adecuada');
            $('#dni').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            dni.setCustomValidity("");
            $('#dni').css("background-color", "white");
        }
        //fin dni
 
        if ($("#nombre").val() == "") {
            nombre.setCustomValidity("Introduzca su nombre.");
            $('#nombre').css("background-color", "#ffeeee");
            resultado = false;
        }else if(!/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/.test($('#nombre').val().trim())){
            nombre.setCustomValidity("Introduzca un nombre válido.");
            $('#nombre').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            nombre.setCustomValidity("");
            $('#nombre').css("background-color", "white");
        }
 
        if ($('#apellidos').val().trim() == '') {
            apellidos.setCustomValidity('Introduzca sus apellidos.');
            $('#apellidos').css("background-color", "#ffeeee");
            resultado = false;
        }else if(!/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/.test($('#apellidos').val().trim())){
            apellidos.setCustomValidity('Introduzca unos apellidos válidos.');
            $('#apellidos').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            apellidos.setCustomValidity("");
            $('#apellidos').css("background-color", "white");
        }
 
        if ($('#email').val().trim() == '') {
            email.setCustomValidity('Introduzca su email.');
            $('#email').css("background-color", "#ffeeee");
            resultado = false;
        } else if (!exprEmail.test($('#email').val().trim())) {
            email.setCustomValidity('Introduzca un email correcto.');
            $('#email').css("background-color", "#ffeeee");
            resultado = false;
        } else if (!exprEmailAlum.test($("#email").val().trim())) {
            email.setCustomValidity("Introduzca un email acabado en @alum.es.");
            $("#email").css("background-color", "#ffeeee");
            resultado = false;
        } else {
            email.setCustomValidity("");
            $('#email').css("background-color", "white");
        }
 
        if ($("#fecha").val().trim() == "") {
            fecha.setCustomValidity("Seleccione su fecha de nacimiento.");
            $("#fecha").css("background-color", "#ffeeee");
            resultado = false;
        } else if (!exprFecha.test( formatearFecha($('#fecha').val().trim()))) {
            fecha.setCustomValidity("Formato no correcto.");
            $("#fecha").css("background-color", "#ffeeee");
            resultado = false;
        }else if( calcularEdad($('#fecha').val()) < 0){
            fecha.setCustomValidity('La fecha debe ser anterior a la actual.');
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
             
        } else if (calcularEdad(formatearFecha($('#fecha').val().trim())) < 18 ) {
            fecha.setCustomValidity("Debes ser mayor de edad.");
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
        } else if (edad < 18 ) { //comprobacion adiccional para evitar fallos al formateo
            fecha.setCustomValidity("Debes ser mayor de edad(18).");
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            fecha.setCustomValidity("");
            $('#fecha').css("background-color", "white");
        }
 
 
        if ($("#curso").val() == "0") {
            curso.setCustomValidity("Selecciona un curso");
            $('#curso').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            curso.setCustomValidity("");
            $('#curso').css("background-color", "white");
        }
 
        if ($("#departamento").val() == "0") {
            departamento.setCustomValidity("Selecciona un departamento");
            $('#departamento').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            departamento.setCustomValidity("");
            $('#departamento').css("background-color", "white");
        }
 
        if ($("#categoria").val() == " ") {
            categoria.setCustomValidity("Selecciona un categoria");
            $('#categoria').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            categoria.setCustomValidity("");
            $('#categoria').css("background-color", "white");
        }
 
        if (!exprDespacho.test($("#despacho").val())) {
            despacho.setCustomValidity("Expresion de despacho no valida");
            $('#despacho').css("background-color", "#ffeeee");
            resultado = false;
        } else if ($("#despacho").val() == "") {
            despacho.setCustomValidity("El despacho no puede estar vacio");
            $('#despacho').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            despacho.setCustomValidity("");
            $('#despacho').css("background-color", "white");
        }
 
        if ($("#pass").val().trim() == "") {
            pass.setCustomValidity('Debes poner una contraseña.');
            $('#pass').css("background-color", "#ffeeee");
            resultado = false;
        } else if ($("#pass").val().length < 8) {
            pass.setCustomValidity('La contraseña debe tener al menos 8 caracteres.');
            $('#pass').css("background-color", "#ffeeee");
            resultado = false;
        } else if (!/[a-z]+/.test($("#pass").val()) || !/[A-Z]+/.test($("#pass").val()) || !/[0-9]+/.test($("#pass").val())) {
            pass.setCustomValidity('La contraseña debe incluir mayusculas, minusculas y un número.');
            $('#pass').css("background-color", "#ffeeee");
            resultado = false;
        } else if ($("#pass").val() != $("#passConf").val()) {
            pass.setCustomValidity('La contraseña debe coincidir con la confirmacion de contraseña.');
            $('#pass').css("background-color", "#ffeeee");
            $('#passConf').css("background-color", "#ffeeee");
            resultado = false;
        } else {
            pass.setCustomValidity("");
            $('#pass').css("background-color", "white");
            $('#passConf').css("background-color", "white");
        }
 
        return resultado;
    }
 
 
    $('.enviarProf').click(function() {
        validacionInsertarProfesor();
    })
}
/* Función para el calendario
 ========================================================================== */
function calendario() {
	
	var arrayFechas = $('[data-Ev="0"]').map(function() {
			    return [($(this).val())];
			    }).toArray();
			var arrayNombres = $('[data-Ev="1"]').map(function() {
			    return [($(this).val())];
			    }).toArray();
			
			
			for (var i = 0; i < arrayFechas.length; i++) {
			 	 	 arrayFechas[i] = moment(arrayFechas[i],"DD/MM/YY").format('DD/MM/YY');
			}
			
	$(function($) {
		$.datepicker.regional['es'] = {
			closeText : 'Cerrar',
			prevText : '<Ant',
			nextText : 'Sig>',
			currentText : 'Hoy',
			monthNames : ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
			monthNamesShort : ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
			dayNames : ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
			dayNamesShort : ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
			dayNamesMin : ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
			weekHeader : 'Sm',
			dateFormat : 'dd/mm/yy',
			firstDay : 1,
			isRTL : false,
			showMonthAfterYear : false,
			yearSuffix : ''
		};
		$.datepicker.setDefaults($.datepicker.regional['es']);
	});

	$("#popup").hide();

	function abrir() {
		$("#popup").show();
		$("#popup").dialog({
			close : function(event, ui) {
				$(this).dialog('destroy');
				$("#popup").hide();
				$("#evento").val("");
			},
			dialogClass : 'popup',
			position : {
				my : 'center',
				at : 'center',
				of : $('#popup')
			},
		});
	}

	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd/mm/yy',
			onSelect : function(date) {
				$("#fecha").val(date);
				abrir();
				$("#fecha").val(date);
			},
			 beforeShowDay: function(date) {
			 	
			 	dmy = date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear().toString().substr(-2);
			 	var dia = moment(dmy,"DD/MM/YY").format("DD/MM/YY");
			 	index = $.inArray(dia,arrayFechas);
			 	if(index != -1){
			 		return [true, 'css-class-to-highlight', arrayNombres[index]];
	           }else{
	           	   return [true, '', ''];
	            
			 	}
  			}	
				
		});
	});

	$(".addEvento").on("click", function() {
		var fecha = $("#fecha").val();
		var nombre = $("#evento").val();
		var DNI = $("#dni").val();
		$.post("anadirEventoAJAX.php", {
			dni : DNI,
			fecha : fecha,
			nombre : nombre
		}, function(mensaje) {
			if (mensaje == "Evento añadido correctamente") {
				$(".resultadoEv").text(mensaje);
				$(".resultadoEv").removeClass("evEliminado");
				$(".resultadoEv").addClass("evAnadido");
				$(".resultadoEv").css('visibility', 'visible').hide().fadeIn('slow');
				setTimeout(function() {
					$(".resultadoEv").css('visibility', 'hidden');
				}, 2000);
				mostrarLista();
				$("#popup").dialog("destroy");
				$("#popup").hide();
				$("#evento").val("");
			}
		});
	});
	$(document).on("click", ".eliminarEv", function() {
		var oid_e = $(this).attr("id");
		var nFila = $(".nfila").val();
		$.post("eliminarEventoAJAX.php", {
			oid_e : oid_e
		}, function(mensaje) {
			if (mensaje == "Evento eliminado") {
				$(".resultadoEv").text(mensaje);
				$(".resultadoEv").removeClass("evAnadido");
				$(".resultadoEv").addClass("evEliminado");
				$(".resultadoEv").css('visibility', 'visible').hide().fadeIn('slow');
				setTimeout(function() {
					$(".resultadoEv").css('visibility', 'hidden');
				}, 2000);
				mostrarLista();
			}
		});
	});

	function mostrarLista() {
		var DNI = $("#dni").val();
		$(".misEventos").empty();
		$.post("mostrarEventosAJAX.php", {
			dni : DNI
		}, function(mensaje) {
			$(".misEventos").append(mensaje);
		});
	};

	mostrarLista();
}


/* Funcion para la comprobación al editar un perfil
 ========================================================================== */

function editarPerfil() {

	function validacionNombre() {
		var nombre = document.getElementById("nombre");

		var resultado = true;

		if ($("#nombre").val() == "") {
			nombre.setCustomValidity("Introduzca un nombre.");
			$('#nombre').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/.test($('#nombre').val().trim())){
			nombre.setCustomValidity("Introduzca un nombre que sea válido.");
			$('#nombre').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			nombre.setCustomValidity("");
			$('#nombre').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionApellidos() {
		var apellidos = document.getElementById("apellidos");
		
		var resultado = true;
		
		if ($('#apellidos').val().trim() == '') {
			apellidos.setCustomValidity('Introduzca unos apellidos.');
			$('#apellidos').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^[A-Za-záéíóúÁÉÍÓÚ\s]+$/.test($('#apellidos').val().trim())){
			apellidos.setCustomValidity("Introduzca un nombre que sea válido.");
			$('#apellidos').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			apellidos.setCustomValidity("");
			$('#apellidos').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionFecha() {
		
		var fecha = document.getElementById("fecha");
	 	var exprFecha = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
		var resultado = true;
		
		if ($("#fecha").val()== "") {
            fecha.setCustomValidity("Seleccione su fecha de nacimiento.");
            $("#fecha").css("background-color", "#ffeeee");
            resultado = false;
        } else if (!exprFecha.test(formatearFecha($('#fecha').val()))) {
            fecha.setCustomValidity("Formato no correcto.");
            $("#fecha").css("background-color", "#ffeeee");
            resultado = false;
        }else if(calcularEdad(formatearFecha($('#fecha').val())) < 0){
            fecha.setCustomValidity('La fecha debe ser anterior a la actual.');
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
             
        } else if(calcularEdad(formatearFecha($('#fecha').val().trim())) < 18 ) {
            fecha.setCustomValidity("Debes ser mayor de edad.");
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
        } else if (edad < 18 ) { //comprobacion adiccional para evitar fallos al formateo
            fecha.setCustomValidity("Debes ser mayor de edad(18).");
            $('#fecha').css("background-color", "#ffeeee");
            resultado = false;
        } else {
			fecha.setCustomValidity("");
			$('#fecha').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionEmail() {
		
		var exprEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		var email = document.getElementById("email");
		
		var resultado = true;

		if ($('#email').val().trim() == '') {
			email.setCustomValidity('Introduzca un email.');
			$('#email').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprEmail.test($('#email').val().trim())) {
			email.setCustomValidity('Introduzca un email correcto.');
			$('#email').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			email.setCustomValidity("");
			$('#email').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionHoraProfesor() {
		var horaInicio = document.getElementById("horaInicio");
		var horaFin = document.getElementById("horaFin");
		
		if($('#horaInicio').val()==""){
			horaInicio.setCustomValidity('La hora de inicio no puede estar vacía');
			$('#horaInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if($('#horaFin').val()==""){
			horaFin.setCustomValidity('La hora final no puede estar vacía');
			$('#horaFin').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/.test($('#horaInicio').val())){
			horaInicio.setCustomValidity('El formato no es correcto.');
			$('#horaInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/.test($('#horaFin').val())){
			horaFin.setCustomValidity('El formato no es correcto.');
			$('#horaFin').css("background-color", "#ffeeee");
			resultado = false;
		}
		else if($('#horaInicio').val().trim().split(":")[0]>$('#horaFin').val().trim().split(":")[0]){
			horaInicio.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			horaFin.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			$('#horaFin').css("background-color", "#ffeeee");
			$('#horaInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if($('#horaInicio').val().split(":")[0]==$('#horaFin').val().split(":")[0] && 
				$('#horaInicio').val().split(":")[1]>=$('#horaFin').val().split(":")[1]){
			horaInicio.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			horaFin.setCustomValidity('Lahora de inicio no puede ser posterior a la final');
			$('#horaFin').css("background-color", "#ffeeee");
			$('#horaInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else{
			horaInicio.setCustomValidity("");
			horaFin.setCustomValidity("");
			$('#horaFin').css("background-color", "white");
			$('#horaInicio').css("background-color", "white");
			var resultado = true;
		}
		return resultado;
	}
	function validacionTelefono() {
		var telefono = document.getElementById("telefono");
		var exprNumero = /^([0-9])+$/;
		var resultado = true;

		if ($('#telefono').val().trim() == '') {
			telefono.setCustomValidity('Introduzca su número de teléfono.');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!exprNumero.test($('#telefono').val().trim())) {
			telefono.setCustomValidity('Un número de teléfono solo puede contener números.');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else if ($('#telefono').val().trim().length < 9) {
			telefono.setCustomValidity('Introduzca un número de teléfono correcto');
			$('#telefono').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			telefono.setCustomValidity("");
			$('#telefono').css("background-color", "white");
		}

		return resultado;
	}
	function validacionDireccion() {
		var direccion = document.getElementById("direccion");
		
		var resultado = true;
		
		if ($('#direccion').val().trim() == '') {
			direccion.setCustomValidity('Introduzca su dirección.');
			$('#direccion').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			direccion.setCustomValidity("");
			$('#direccion').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionProvincia() {
		var provincia = document.getElementById("provincia");
		
		var resultado = true;
		
		if ($("#provincia").val() != "Almería" && $("#provincia").val() != "Cádiz" && $("#provincia").val() != "Córdoba" && $("#provincia").val() != "Granada" && $("#provincia").val() != "Huelva" && $("#provincia").val() != "Jaén" && $("#provincia").val() != "Sevilla" && $("#provincia").val() != "Málaga" || $("#provincia") == "") {
			provincia.setCustomValidity('Introduzca su provincia');
			$('#provincia').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			direccion.setCustomValidity("");
			$('#provincia').css("background-color", "white");
		}

		return resultado;
	}
	
	function validacionCP() {
		var cPostal = document.getElementById("cpostal");
		
		var resultado = true;
		
		if ($('#cpostal').val().trim() == '') {
			cPostal.setCustomValidity('Introduzca su código postal');
			$('#cpostal').css("background-color", "#ffeeee");
			resultado = false;
		} else if (!($('#cpostal').val().trim().length == 5) || (!exprNumero.test($('#cpostal').val()))) {
			cPostal.setCustomValidity('Introduzca un código postal válido');
			$('#cpostal').css("background-color", "#ffeeee");
			resultado = false;
		} else {
			cPostal.setCustomValidity("");
			$('#cpostal').css("background-color", "white");
		}

		return resultado;
	}


	$('#grabarNombre').click(function() {
		validacionNombre();
	})
	
	$('#grabarApellidos').click(function() {
		validacionApellidos();
	})
	
	$('#grabarFecha').click(function() {
		validacionFecha();
	})
	
	$('#grabarEmail').click(function() {
		validacionEmail();
	})
	$('#grabarHorario').click(function() {
		validacionHoraProfesor();
	})
	$('#grabarTelefono').click(function() {
		validacionTelefono();
	})
	$('#grabarDireccion').click(function() {
		validacionDireccion();
	})
	$('#grabarProvincia').click(function() {
		validacionProvincia();
	})
	$('#grabarCP').click(function() {
		validacionCP();
	})
	
	//Para la comprobacion de EditarAlumno utilizo tambien las funciones de ValidaForm1, para evitar crear funciones que ya estan creadas mas arriba
}

function validarMeterHorario() {
	
	function validacionHoraHorario() {
		
		var horaInicio = document.getElementById("inputHoraInicio");
		var horaFin = document.getElementById("inputHoraFin");
		
		if($('#inputHoraInicio').val()==""){
			horaInicio.setCustomValidity('La hora de inicio no puede estar vacía');
			$('#inputHoraInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if($('#inputHoraFin').val()==""){
			horaFin.setCustomValidity('La hora final no puede estar vacía');
			$('#inputHoraFin').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/.test($('#inputHoraInicio').val())){
			horaInicio.setCustomValidity('El formato no es correcto.');
			$('#inputHoraInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if(!/^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/.test($('#inputHoraFin').val())){
			horaFin.setCustomValidity('El formato no es correcto.');
			$('#inputHoraFin').css("background-color", "#ffeeee");
			resultado = false;
		}
		else if($('#inputHoraInicio').val().trim().split(":")[0]>$('#inputHoraFin').val().trim().split(":")[0]){
			horaInicio.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			horaFin.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			$('#inputHoraFin').css("background-color", "#ffeeee");
			$('#inputHoraInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else if($('#inputHoraInicio').val().split(":")[0]==$('#inputHoraFin').val().split(":")[0] && 
				$('#inputHoraInicio').val().split(":")[1]>=$('#inputHoraFin').val().split(":")[1]){
			horaInicio.setCustomValidity('La hora de inicio no puede ser posterior a la final');
			horaFin.setCustomValidity('Lahora de inicio no puede ser posterior a la final');
			$('#inputHoraFin').css("background-color", "#ffeeee");
			$('#inputHoraInicio').css("background-color", "#ffeeee");
			resultado = false;
		}else{
			horaInicio.setCustomValidity("");
			horaFin.setCustomValidity("");
			$('#inputHoraFin').css("background-color", "white");
			$('#inputHoraInicio').css("background-color", "white");
			var resultado = true;
		}
		return resultado;
	}
	
	$('#confirmarHorario').click(function() {
		validacionHoraHorario();
	})
}



