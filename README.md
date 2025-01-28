# Ejemplos de Menús en Lenguaje Ensamblador (NASM y RadASM)

Este repositorio contiene ejemplos prácticos de implementación de menús en lenguaje ensamblador, utilizando NASM y RadASM (MASM). Estos ejemplos están diseñados para mostrar cómo se pueden crear interfaces básicas de usuario en entornos de bajo nivel, haciendo uso de interrupciones, estructuras de control y manejo de memoria.

## 📂 Contenido del Repositorio

### NASM/
Contiene ejemplos de menús implementados con NASM para la arquitectura x86.

- **menu_basico.asm**: Menú simple con opciones básicas.
- **menu_con_validacion.asm**: Menú con validación de entrada del usuario.

### RadASM (MASM)/
Contiene ejemplos de menús implementados con MASM utilizando RadASM.

- **menu_simple.asm**: Ejemplo básico de menú en un entorno Windows.
- **menu_avanzado.asm**: Menú con manejo avanzado de entrada y salida.

## 🛠 Requisitos

### Para NASM
- NASM instalado en tu sistema.
- Un entorno como DOSBox para ejecutar programas de 16 bits en sistemas modernos.

### Para RadASM (MASM)
- RadASM IDE o un entorno compatible con MASM.
- MASM instalado y configurado.

## 🚀 Ejecución de los Ejemplos

### NASM
1. Ensambla el archivo con:
   ```bash
   nasm -f bin menu_basico.asm -o menu_basico.com
   ```
2. Ejecuta el programa con DOSBox:
  ```bash
  dosbox menu_basico.com
  ```
### RadASM (MASM)
1. Abre el proyecto en RadASM.
2. Ensambla y ejecuta el archivo directamente desde el IDE.

## 📖 Temas Cubiertos
- Creación de menús textuales interactivos.
- Uso de interrupciones como `INT 21h`.
- Validación de entrada de usuario.
- Estructuras de control básicas (bucles y condicionales).
- Optimización y manejo eficiente de recursos en ensamblador.

## 🤝 Contribuciones
Las contribuciones son bienvenidas. Si tienes ejemplos adicionales o mejoras para estos, ¡no dudes en enviar un pull request!

## 📄 Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más información.
