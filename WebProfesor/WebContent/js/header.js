$(function () {
	$("#mensajes a:contains('Mensajes')").parent().addClass("active");
	$("#mensaje a:contains('Mensajes')").parent().addClass("active");
	$("#index a:contains('Inicio')").parent().addClass("active");
	$("#estadisticas a:contains('Estadisticas')").parent().addClass("active");
	$("#addMundo a:contains('Mundo')").parent().addClass("active");
	$("#addNivel a:contains('Nivel')").parent().addClass("active");
	$("#addProblema a:contains('Problema')").parent().addClass("active");
	
	if($("#addMundo a:contains('Mundo')").parent().hasClass("active")){
		$(".dropdown a:contains('Nuevo')").parent().addClass("active");
	}
	
	if($("#addNivel a:contains('Nivel')").parent().hasClass("active")){
		$(".dropdown a:contains('Nuevo')").parent().addClass("active");
	}
	
	if($("#addProblema a:contains('Problema')").parent().hasClass("active")){
		$(".dropdown a:contains('Nuevo')").parent().addClass("active");
	}
	
	
	
});
