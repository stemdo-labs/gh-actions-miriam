## Ejercicios de Github Actions  para iniciarse en el Mundo de DevOps

¡Bienvenido/a al ejercicio de Github Actions para iniciarse en el mundo de DevOps!

Este repositorio contiene un ejercicio diseñado para ayudarte a familiarizarte con __Github Actions__ y el __CI/CD__.

## Objetivos

El propósito principal de este ejercicio es _proporcionarte una introducción práctica a los conceptos de Github Actions_ que son esenciales para cualquier persona interesada en trabajar en el área de DevOps. Al completar estos ejercicios, esperamos que adquieras experiencia práctica con:

- Workflows
- Actions/ Custom Actions
- Workflows reusables
- Secrets y entornos

## Estructura del Repositorio

En este repositorio encontraréis un proyecto básico de _Angular_. Para el cual tendréis que elaborar los workflows necesarios para la __Integración Continua__ y el __Despliegue Continuo (CI/CD)__.

El workflow de __CI__ será el encargado de _realizar el build de la aplicación angular_, construir la imagen y subirla al registry. (Dockerhub)

El workflow de __CD__ será el encargado de _bajar esa imagen y realizar el despliegue_. (Este despliegue lo simularemos haciendo un curl al html de la aplicación que sirve el nginx)

La rama main/master será de desplegar en el entorno de production y la rama de development la usaremos para despliegues e integraciones continuas en uat.

### Requerimientos

- Uso de distintos triggers
- Uso de reusables (para entender cómo se pueden reusar workflows ya existentes, de esta manera no repetimos código ya escrito anteriormente.)
- Uso de custom actions (composite)
- Uso de variables y secrets de environments (en un entorno real, vas a encontrarte con distintas variables por entorno)
- Job que simulen la ejecución de Test de Cobertura de Código (en un entorno profesional vas a encontrarte con test de código, nosotros tenemos que encargarnos de que se lleven a cabo) Estos jobs se ejecutarán solo si estamos en el entorno "production", no en el de "uat".
- Uso de aprobadores por entornos. (Investigad)

## Contribución

¡Tus contribuciones son bienvenidas! Si tienes ideas para nuevos ejercicios o mejoras para los existentes, no dudes en abrir un issue o abrir un pull request.
