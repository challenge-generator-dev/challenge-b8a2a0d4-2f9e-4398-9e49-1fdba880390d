# Versionado de Infraestructura con Terraform para el Servicio de Notificaciones

El objetivo es aprovisionar y versionar la infraestructura del servicio de notificaciones utilizando Terraform. El sistema debe desplegar la red y el computo necesario para el servicio, asegurando que la configuración sea reproducible y versionada.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 10 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y definir los recursos básicos para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Configura Terraform para conectarse al proveedor de nube.
- Define los recursos básicos de red y computo necesarios para el servicio de notificaciones.
- Asegura que la configuración inicial sea reproducible y versionada.

**Entregable:** Configuración inicial de Terraform con recursos básicos definidos y versionados.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de proveedores de Terraform.
- Definición de recursos en Terraform.

</details>

### Fase 2: Aprovisionamiento de la Infraestructura

**Objetivo:** Aprovisionar la red y el computo del servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 4 horas

**Instrucciones:**

- Ejecuta Terraform para aprovisionar los recursos definidos.
- Verifica que los recursos se hayan desplegado correctamente.
- Documenta el proceso de aprovisionamiento.

**Entregable:** Infraestructura del servicio de notificaciones aprovisionada y documentada.

<details>
<summary>Pistas de conocimiento</summary>

- Ejecución de comandos de Terraform.
- Verificación de despliegue de recursos.

</details>

### Fase 3: Versionado de la Infraestructura

**Objetivo:** Versionar la configuración de Terraform para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crea un repositorio de versionamiento para la configuración de Terraform.
- Versiona la configuración de Terraform en el repositorio.
- Asegura que la configuración versionada sea reproducible.

**Entregable:** Configuración de Terraform versionada en un repositorio.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de sistemas de versionamiento (e.g., Git).
- Prácticas de versionado de configuración.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el aprovisionamiento de infraestructura?
- **paraQueSirve**: ¿Cuál es el propósito de versionar la configuración de Terraform?
- **comoSeUsa**: ¿Cómo se configura y ejecuta Terraform para aprovisionar recursos?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones se deben tomar al versionar la configuración de Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform con recursos básicos definidos y versionados.
- Infraestructura del servicio de notificaciones aprovisionada y documentada.
- Configuración de Terraform versionada en un repositorio.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
