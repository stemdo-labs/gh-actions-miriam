# Solución GitHub Actions (CI/CD)

En este ejercicio, se implementaron dos workflows principales para la Integración Continua (CI) y el Despliegue Continuo (CD) en un proyecto Angular con Docker, siguiendo los requerimientos establecidos. Aquí te detallo cómo se cumplieron los objetivos y requerimientos con dos entornos distintos ``uat`` y ``producción``.

## 1. Workflows implementados

- CI para producción y uat

    Los archivos ``ci-production.yml`` y ``ci-uat.yml`` son los workflows responsables de:

    - Compilar la aplicación Angular.
    - Construir la imagen Docker y subirla a DockerHub.

- CD para producción y uat

    Los archivos ``cd-production.yml`` y ``ci-uat.yml`` se encargan de:

    - Descargar la imagen Docker desde DockerHub.
    - Desplegar la aplicación en producción simulando una verificación mediante ``curl``.

## 2. Requerimientos y Cómo se Cumplieron

- **Uso de Triggers**
Se implementaron distintos triggers para disparar los workflows manualmente (workflow_dispatch) o al completar otro workflow (workflow_run). En este caso, el despliegue (CD) se dispara cuando el workflow de CI se completa. También se han usado los disparadores para cuando se hace una _pull_ o un _push_: en la rama ``main`` para el entorno de producción, y en la rama ``development`` para el entorno de uat.

- **Reusable Workflows**
Se creó un workflow reusable llamado ``reusable-build.yml`` que realiza los pasos de build y push a DockerHub. Este archivo es reutilizado tanto por el workflow de producción y el de uat, evitando así duplicar código.

- **Custom Actions (Composite)**
Se ha desarrollado una acción personalizada para el login en DockerHub (docker-login) llamado ``action.yml``. Esto encapsula la lógica de autenticación y permite reutilizarla en múltiples workflows.

- **Variables y Secrets de Environments**
Se han utilizado ``secrets`` (como DOCKER_USERNAME y DOCKER_PASSWORD), que son referenciados en los workflows para gestionar la seguridad y mantener la flexibilidad según el ambiente de despliegue.

- **Test de Cobertura de Código (Solo en Producción)**
Se ha agregado un job en el archivo ``reusable-build.yml`` que simula la ejecución de tests de cobertura de código solo para el entorno de producción.

- **Aprobadores por entornos**
En la creación de los entornos, se ha implementado para el entorno de producción una _Protection rules_ con la opción _Require approval_ habilitada, con lo cual cuando se ejecuta el CD de producción para realizar el despliegue, pide la aprobación de los usuarios asignados.
