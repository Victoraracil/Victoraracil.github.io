Instrucciones para publicar esta carpeta en GitHub Pages

1. Crea un nuevo repositorio en GitHub y sube el contenido de la carpeta `github`.
2. En la configuración del repositorio, ve a **Pages** y selecciona la rama `main` (o `master`) y la carpeta `/ (root)` si subiste los archivos al root del repositorio, o selecciona `/docs` si moviste estos archivos a la carpeta `docs`.
3. Asegúrate de que `index.md` esté en el root del sitio. GitHub Pages procesará archivos Markdown con Jekyll y aplicará el tema por defecto o el que configures.

Notas sobre rutas y recursos:
- `logo.jpg` y la carpeta `style/` están referenciadas con rutas absolutas desde la raíz (`/logo.jpg`, `/style/style.css`). Si subes solo la carpeta `github` como root del repo, mantén `logo.jpg` y `style/` en el root del repo. Si los colocas en `docs/` o en otra carpeta, ajusta las rutas a `./logo.jpg` o `./style/style.css`.
- Alternativa: usa un tema Jekyll o agrega un `_layouts/default.html` personalizado para replicar tu HTML original con mayor fidelidad.

Si quieres, puedo generar un `_layouts/default.html` mínimo y copiar tu `style/style.css` y `logo.jpg` dentro de `github` para que el sitio se vea igual al original.
 
Copiar assets localmente
-----------------------

En este entorno no puedo copiar archivos binarios (como `logo.jpg`) automáticamente. He añadido un script PowerShell (`copy_assets.ps1`) dentro de la carpeta `github/` que copia los archivos necesarios desde la raíz del proyecto hacia `github/`.

Para ejecutar el script desde tu máquina (PowerShell), abre una terminal en la carpeta raíz del proyecto y corre:

```powershell
& .\github\copy_assets.ps1
```

El script intentará copiar: `logo.jpg`, `cv.pdf`, y los directorios `style/` y `assets/` hacia la carpeta `github/`. Si algún archivo no existe, lo notificará.

Después de copiar los assets, sube el contenido de la carpeta `github/` a tu repositorio en GitHub y configura GitHub Pages (rama `main`, carpeta `root` o `docs`) como se describe arriba.

Si prefieres, puedo ajustar las rutas en `_layouts/default.html` y en los `.md` para usar rutas relativas en lugar de rutas desde la raíz — dime qué estructura quieres subir en el repositorio (`root` o `docs`).