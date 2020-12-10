for (const alumno of datos) {
    let alu = document.createElement("ul");
    document.body.appendChild(alu);
    for (const prop in alumno) {
        let elemento = document.createElement("li");
        elemento.innerHTML = prop + ": " + alumno[prop];
        alu.appendChild(elemento);
    }
}

