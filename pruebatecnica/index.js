// Carga de datos de la base de datos
loadRegiones();
loadCandidatos();

async function loadCandidatos() {
    const response = await makeRequest("GET", "db.php?tipo=candidato");
    JSON.parse(response).forEach(candidato => {
        // Agregamos las opciones al select de candidatos
        document.querySelector('#candidato_select').innerHTML += `<option value="${candidato.rut}">${candidato.nombre} ${candidato.apellido}</option>`;
    });
}

async function loadRegiones() {
    const response = await makeRequest("GET", "db.php?tipo=region");
    JSON.parse(response).forEach(region => {
        // Agregamos las opciones al select de regiones
        document.querySelector('#region_select').innerHTML += `<option value="${region.id}">${region.nombre}</option>`;
    });
}

async function getComunas() {
    const region = document.querySelector('#region_select').value;
    const response = await makeRequest("GET", `db.php?tipo=comuna&region=${region}`);
    JSON.parse(response).forEach(comuna => {
        // Agregamos las opciones al select de comunas
        document.querySelector('#comuna_select').innerHTML += `<option value="${comuna.id}">${comuna.nombre}</option>`;
    });
}

async function alreadyVoted(rut) {
    const newRut = rut.split('-')[0];
    const response = await makeRequest("GET", `db.php?tipo=voto&rut=${newRut}`);
    const responseJson = JSON.parse(response);
    return responseJson.length > 0;
}

async function validarFormulario(e) {
    e.preventDefault();
    let errors = '';
    const nombre = document.querySelector('#nombre_apellido').value;
    if (nombre === '') {
        errors += '<span>- Por favor ingrese su nombre y Apellido</span>';
    }

    const alias = document.querySelector('#alias').value;
    if (!alias.length > 5 || !/[a-zA-Z0-9]/g.test(alias)) {
        errors += '<span>- Por favor ingrese un alias válido</span>';
    }

    const rut = document.querySelector('#rut').value;
    // Expresión regular para validar que el rut sea de 7 a 8 dígitos y que tenga un guión seguido de un
    // carácter del 0 al 9 o una K.
    if (!/^[0-9]{7,8}-[0-9K]/g.test(rut) || rut === '') {
        errors += '<span>- Por favor ingrese un rut válido con su dígito verificador separado por un -</span>';
    } else if (!validarRut(rut)) {
        errors += '<span>- Por favor ingrese un rut que corresponda a su dígito verificador</span>';
    }
    
    const hasVoted = await alreadyVoted(rut);
    if (hasVoted) {
        errors += '<span>- Usted ya ha votado</span>';
    }

    const email = document.querySelector('#email').value;
    // Expresión regular para validar el email (Estándar).
    if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/g.test(email) || email === '') {
        errors += '<span>- Por favor ingrese un email válido</span>';
    }

    const region = document.querySelector('#region_select').value;
    if (region === '') {
        errors += '<span>- Por favor seleccione una región</span>';
    }
    const comuna = document.querySelector('#comuna_select').value;
    if (comuna === '') {
        errors += '<span>- Por favor seleccione una comuna</span>';
    }

    const candidato = document.querySelector('#candidato_select').value;
    if (candidato === '') {
        errors += '<span>- Por favor seleccione un candidato</span>';
    }

    const checkBoxes = document.querySelectorAll('.check-box-container input');
    const checked = Array.from(checkBoxes).filter(checkBox => checkBox.checked);
    if (checked.length < 2) {
        errors += '<span>- Por favor seleccione al menos 2 opciones</span>';
    } else {
        let checkedValues = '';
        checked.forEach(checkBox => {
            let valueFormatted = checkBox.value.slice(0, 1).toUpperCase() + checkBox.value.slice(1).toLowerCase();
            checkedValues += `${valueFormatted}, `
        });
        if (checkedValues.endsWith(', ')) {
            checkedValues = checkedValues.slice(0, -2);
        }
        document.querySelector('#como_se_entero').value = checkedValues;
    }

    // Revisamos si es que hay errores, si es así, evitamos que se envíe el formulario y
    // mostramos los errores.
    if (errors.length > 0) {
        //e.preventDefault();
        document.querySelector('.error-messages .errors').innerHTML = errors;
        document.querySelector('.error-messages').style.display = 'flex';
        return false;
    }

    return true;
}

function validarRut(rut) {
    // Esta validación de RUT está hecho en base al algoritmo de Módulo 11.
    // http://cauditor2.blogspot.com/2009/09/modulo-11-o-validador-de-rut.html
    // https://es.wikipedia.org/wiki/Código_de_control
    const newRut = rut.split('-')[0];
    const baseDv = rut.split('-')[1];
    // Nos aseguramos de que el RUT contenga un guión y que el dígito verificador.
    if (!baseDv) return false;
    const rutArray = newRut.split('').reverse()
    let acumulador = 0;
    let multiplicador = 2;
    for (let digito of rutArray) {
        acumulador += parseInt(digito) * multiplicador;
        multiplicador++;
        if (multiplicador == 8) {
            multiplicador = 2;
        }
    }

    let dvGenerado = 11 - (acumulador % 11);

    if (dvGenerado == 11)
        dvGenerado = '0'
    if (dvGenerado == 10)
        dvGenerado = 'k';

    return baseDv.toLowerCase() == dvGenerado;
}

function makeRequest(method, url) {
    return new Promise(function (resolve, reject) {
        let xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.onload = function () {
            if (this.status >= 200 && this.status < 300) {
                resolve(xhr.response);
            } else {
                reject({
                    status: this.status,
                    statusText: xhr.statusText
                });
            }
        };
        xhr.onerror = function () {
            reject({
                status: this.status,
                statusText: xhr.statusText
            });
        };
        xhr.send();
    });
}