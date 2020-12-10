console.log(datos);

for (let i = 0; i < datos.length; i++) {
    console.log(datos[i].paginas);
    
}
for (const alumno of datos) {
    console.log(alumno.calificacion);
}

let tablaTemperaturas =[
    ["Huesca", 20.5, 10.5, 14.3],
    ["Zaragoza", 22.5, 12.5, 13.6],
    ["Teruel", 15.5, 5.4, 10.1],
    ["Lérida", 18.5, 4.5, 8.3],
]

console.log(tablaTemperaturas[0][2]);

for (let i = 0; i < tablaTemperaturas.length; i++) {
    for (let j = 0; j < tablaTemperaturas[i].length; j++) {
        console.log("Ciudad: "+i);
        console.log("Valor: "+j);
    }
    
}

for (const ciudad of tablaTemperaturas) {
    for (const valor of ciudad) {
        console.log(valor);
    }
    
}