#!/bin/bash

# Función recursiva para buscar archivos pom.xml en carpetas anidadas
search_pom() {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            search_pom "$file"  # Llamada recursiva para carpetas anidadas
        elif [[ "$file" == *pom.xml ]]; then
            echo "Ejecutando 'mvn clean' en la carpeta: $1"
            cd "$1"
            mvn clean
            break  # Si solo quieres ejecutar mvn clean en la primera coincidencia, puedes eliminar este 'break'
        fi
    done
}

# Llamada inicial para buscar desde la carpeta actual
search_pom "$(pwd)"
