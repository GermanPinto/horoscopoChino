$(document).ready(function () {


function validarAdd(){
	
    var correo = document.getElementById("emailAdd").value;
	var fecha = document.getElementById("fechaAdd").value;

    const formatoCorreo=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	const formatoFecha= /^(\d{1,2})-(\d{1,2})-(\d{4})$/;
    //valida campos no vacios
	//"dd-mm-aaaa"

	if(!formatoCorreo.test(correo)){
        alert("Ingrese un correo válido");
        return false;
    }
    else if(correo.length>100){
        alert("El correo es muy largo");
        return false;
    }
	if(!formatoFecha.test(fecha)){
        alert("Ingrese fecha con formato 'dd-mm-aaaa' ");
        return false;
    }
    else{
        return true;
    }
}

/*Esta función va a elegír que mostrar en el navBar, si Los opciones para logearse o el usuario logeado */
function eligeMostrarDivLogeoNav() {
	var usuarioLogueado= document.getElementById("usuarioLogueado");
	var registroIdentificacion= document.getElementById("registroIdentificacion");
	if(usuarioLogueado.style.display==="none"){
		registroIdentificacion.style.display="block";
	}else{
		registroIdentificacion.style.display="none";
	}
	registroIdentificacion.style.display="none";

}

	
})