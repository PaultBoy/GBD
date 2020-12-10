for (const alumno of datos) {
    let alu = document.createElement("ul");
    document.body.appendChild(alu);
    for (const prop in alumno) {
        let elemento = document.createElement("li");
        elemento.innerHTML = prop + ": " + alumno[prop];
        alu.appendChild(elemento);
    }
}

//Modificad el programa para que sean listas anidadas.
//* Alumno (acg63):
//  - tiempo: 1898
//  ---
//* Alumno (adf73):
//  - tiempo: 180
//  - ...
//* Alumno...

for (const alumno of datos) {
    let alu = document.createElement("ul");
    document.body.appendChild(alu);
    let id = document.createElement("li");
    id.innerHTML = alumno.identificadorAlumno;
    alu.appendChild(id);
    let param = document.createElement("ul");
    id.appendChild(param);
    for (const prop in alumno) {
        if(prop != 0){
            let el = document.createElement("li");
            el.innerHTML = prop + ": " + alumno[prop];
        }
    }
}