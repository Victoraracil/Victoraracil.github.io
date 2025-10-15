---
layout: default
title: "Apuntes — Índice"
permalink: /apuntes/index.html
---

<h2>Índice de Apuntes</h2>
<p class="muted">Listado de apuntes.</p>

<div id="notes-list" class="notes-container" aria-live="polite"></div>

<template id="note-template">
  <a class="note-card" href="#">
    <h4 class="note-title">Título</h4>
    <p class="note-desc">Descripción</p>
    <div class="note-meta muted" style="margin-top:.6rem;font-size:.85rem;">Estado: <span class="note-status">?</span></div>
  </a>
</template>

<script>
(function(){
  const subjects = [
    {file: '/apuntes_mantenimiento/bases-de-datos.html', title: 'Bases de Datos', desc: 'Modelos, SQL, normalización y prácticas'},
    {file: '/apuntes_mantenimiento/csharp.html', title: 'C#', desc: 'Sintaxis, LINQ, programación orientada a objetos'},
    {file: '/apuntes_mantenimiento/java.html', title: 'Java', desc: 'JVM, clases, colecciones y ejemplos prácticos'},
    {file: '/apuntes_mantenimiento/ingles.html', title: 'Inglés', desc: 'Vocabulario técnico y lectura técnica'},
    {file: '/apuntes_mantenimiento/python.html', title: 'Python', desc: 'Sintaxis, scripts y módulos comunes'},
    {file: '/apuntes_mantenimiento/html-css.html', title: 'HTML y CSS', desc: 'Maquetación, accesibilidad y responsive'},
    {file: '/apuntes_mantenimiento/javascript.html', title: 'JavaScript', desc: 'DOM, event loop y buenas prácticas'},
    {file: '/apuntes_mantenimiento/php.html', title: 'PHP', desc: 'Servidor, formularios y conexión a bases de datos'}
  ];

  const list = document.getElementById('notes-list');
  const tpl = document.getElementById('note-template');

  subjects.forEach(s => {
    const node = tpl.content.cloneNode(true);
    const a = node.querySelector('a');
    a.href = s.file;
    node.querySelector('.note-title').textContent = s.title;
    node.querySelector('.note-desc').textContent = s.desc;
    const statusEl = node.querySelector('.note-status');
    list.appendChild(node);

    // Folder-based status: maintenance folder = not available; apuntes folder = available
    if (s.file.includes('/apuntes_mantenimiento/')) {
      statusEl.textContent = 'no disponible';
      a.classList.add('muted');
    } else if (s.file.includes('/apuntes/')) {
      statusEl.textContent = 'disponible';
    } else {
      // Fallback: try HEAD request when hosted
      statusEl.textContent = 'comprobando...';
      fetch(s.file, { method: 'HEAD' }).then(resp => {
        const cards = Array.from(list.querySelectorAll('.note-card'));
        const match = cards.find(c=> c.getAttribute('href') === s.file);
        if (resp.ok && match) {
          match.querySelector('.note-status').textContent = 'disponible';
        } else if (match) {
          match.querySelector('.note-status').textContent = 'no disponible';
          match.classList.add('muted');
        }
      }).catch(()=>{
        const cards = Array.from(list.querySelectorAll('.note-card'));
        const match = cards.find(c=> c.getAttribute('href') === s.file);
        if (match) match.querySelector('.note-status').textContent = 'por comprobar (archivo local o file://)';
      });
    }
  });

  // small nav active marker
  const navLinks = document.querySelectorAll('nav a'); navLinks.forEach(a=>{ if (a.href.includes(location.pathname.split('/').pop())) a.classList.add('active'); });
})();
</script>
