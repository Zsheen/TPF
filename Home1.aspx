﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home1.aspx.cs" Inherits="IDS348_FinalProject.Home1" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Twitter - Home</title>
        <style>
        @charset "UTF-8";
html, body, div, script, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video, button, .btnTwittear {
  margin: 0;
  padding: 0;
  border: 0;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  vertical-align: baseline;
}

img,
picture,
video,
iframe,
figure {
  max-width: 100%;
  width: 100%;
  display: block;
  -o-object-fit: cover;
     object-fit: cover;
  -o-object-position: center center;
     object-position: center center;
}

a {
  display: block;
}

p a {
  display: inline;
}

li {
  list-style-type: none;
}

html {
  scroll-behavior: smooth;
}

h1,
h2,
h3,
h4,
h5,
h6,
p,
span,
a,
strong,
blockquote,
i,
b,
u,
em {
  font-size: 1em;
  font-weight: inherit;
  font-style: inherit;
  text-decoration: none;
  color: inherit;
}

blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}

::-moz-selection {
  background-color: var(--negro);
  color: var(--blanco);
}

::selection {
  background-color: var(--negro);
  color: var(--blanco);
}

form,
input,
textarea,
select,
button,
label, .btnTwittear {
  font-family: inherit;
  font-size: inherit;
  -webkit-hyphens: auto;
      -ms-hyphens: auto;
          hyphens: auto;
  background-color: transparent;
  display: block;
  color: inherit;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
}

table,
tr,
td {
  border-collapse: collapse;
  border-spacing: 0;
}

svg {
  width: 100%;
  display: block;
  fill: currentColor;
}

body {
  font: normal normal normal 100%/140% Fakt Pro Medium, "Roboto", sans-serif;
  -webkit-hyphens: auto;
      -ms-hyphens: auto;
          hyphens: auto;
  color: #181818;
  background: #e7e7e7;
  min-height: 100vh;
  background-color: var(--blanco);
  hyphens: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

::-webkit-scrollbar {
  width: 10px;
}

::-webkit-scrollbar-track {
  background: #2c333e;
}

::-webkit-scrollbar-thumb {
  background: #1da1f2;
  border-radius: 1em;
}

::-webkit-scrollbar-thumb:hover {
  background: #71c9f8;
}

.index {
  background: #15202b;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: white;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row wrap;
          flex-flow: row wrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
}
.index .der {
  width: 50%;
  height: calc( 100vh - 50px );
  background: #71c9f8;
  overflow: hidden;
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.index .der__ul {
  width: 100%;
  max-width: 310px;
  position: relative;
  z-index: 2;
}
.index .der__li {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
  margin: 0 0 1.7em;
  font-weight: bold;
}
.index .der__li svg {
  width: 1.55em;
  margin: 0 1em 0 0;
  fill: white;
}
.index .der__fondo {
  width: 200%;
  height: 200%;
  position: absolute;
  top: -45%;
  left: -32%;
  z-index: 1;
  fill: #1da1f2;
  -webkit-transform: scale(0.85);
          transform: scale(0.85);
}
.index .izq {
  width: 50%;
  height: calc( 100vh - 50px );
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-flow: column nowrap;
          flex-flow: column nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.index .izq__form {
  width: 100%;
  max-width: 600px;
  height: 100px;
  margin: 0.5em 0 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
  font-size: 0.8em;
  color: #8899a6;
}
.index .form__input {
  width: calc( 100% / 3 - 1em);
  background: rgba(255, 255, 255, 0.036);
  padding: 0.2em;
  margin: 0 1em 0 0;
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: reverse;
      -ms-flex-flow: column-reverse nowrap;
          flex-flow: column-reverse nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
}
.index .form__input label {
  padding: 0 0.3em;
}
.index .form__input input {
  width: 100%;
  border-bottom: 2px solid #8899a6;
  outline: none;
  color: white;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  font-size: 1.2em;
  font-weight: 600;
}
.index .form__input input:focus {
  border-color: #1da1f2;
}
.index .form__input input:focus + label {
  color: #1da1f2;
}
.index .form__input a {
  position: absolute;
  color: #1da1f2;
  font-size: 0.8em;
  padding: 0 0 0 0.2em;
  bottom: -2em;
}
.index .form__submit {
  margin: 0.6em 0 0;
  padding: 0.5em 1.3em;
  border-radius: 2em;
  color: #1da1f2;
  border: 1px solid #1da1f2;
  font-weight: 700;
  cursor: pointer;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.index .form__submit:hover {
  background: rgba(29, 160, 242, 0.194);
}
.index .izq__centrado {
  width: 100%;
  max-width: 320px;
  margin: 24vh 0 0;
}
.index .izq__logo {
  width: 2.1em;
  fill: white;
}
.index .izq__h2 {
  font-size: 1.5em;
  font-weight: 800;
  line-height: 1.3em;
  margin: 0.3em 0 2em;
}
.index .izq__h3 {
  font-size: 0.8em;
  font-weight: bold;
}
.index .izq__button {
  width: 100%;
  margin: 0.35em 0;
  padding: 0.35em 0;
  border-radius: 1em;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  font-size: 0.8em;
  font-weight: bold;
  border: 1px solid transparent;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.index .boton-registrate {
  background: #1da1f2;
}
.index .boton-registrate:hover {
  background: #1b8ed5;
}
.index .boton-iniciar {
  border-color: #1da1f2;
  color: #1da1f2;
}
.index .boton-iniciar:hover {
  background: rgba(29, 160, 242, 0.194);
}
.index .footer {
  width: 100%;
  min-height: 50px;
  text-align: center;
  padding: 0.5em 0;
  font-size: 0.65em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.index .footer__ul {
  width: 95%;
  margin: auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row wrap;
          flex-flow: row wrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.index .footer__li {
  margin: 0 1em 0.5em;
  color: #8899a6;
}
.index .footer__li a {
  font-weight: 500;
}
.index .footer__li a:hover {
  text-decoration: underline;
}
.index .footer__buttons {
  display: none;
}

@media screen and (max-width: 1000px) {
  .index .izq__form {
    display: none;
  }
}
@media screen and (max-width: 800px) {
  .index {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
    font-size: 18px;
  }
  .index .der, .index .izq {
    width: 100%;
    min-height: 50vh;
    height: auto;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
  }
  .index .der {
    -webkit-box-ordinal-group: 3;
        -ms-flex-order: 2;
            order: 2;
  }
  .index .izq {
    -webkit-box-ordinal-group: 2;
        -ms-flex-order: 1;
            order: 1;
  }
  .index .izq__centrado {
    margin: 0;
  }
  .index .footer {
    -webkit-box-ordinal-group: 4;
        -ms-flex-order: 3;
            order: 3;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
    padding: 2em 0;
  }
  .index .footer__buttons {
    width: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    margin: 2em 0 3em;
    display: flex;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
        -ms-flex-flow: row nowrap;
            flex-flow: row nowrap;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
  }
  .index .footer__button {
    margin: 0 0.8em;
    padding: 0.5em 2em;
    border-radius: 2em;
    font-size: 1.2em;
    font-weight: 900;
  }
  .index .boton-iniciar {
    border: 1px solid #1da1f2;
  }
}
@media screen and (max-width: 320px) {
  .index .der, .index .izq {
    padding: 2em;
  }
}
.home {
  min-height: 200vh;
  background: #15202b;
}
.home .centrado {
  width: calc( 100% - ((20% + 250px) + (20% + 300px)) );
  min-height: 100vh;
  position: relative;
  left: calc( 20% + 250px );
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.home .columna {
  width: 100%;
  min-height: 100vh;
}
.home .izq {
  width: 250px;
  padding: 1em 2em 0 0;
  border-right: 1px solid #38444d;
  position: fixed;
  top: 0px;
  left: 20%;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.home .izq__h1 {
  margin: 1em 1em 1em 1em;
}
.home .izq__svg {
  width: 1.9em;
  height: 1.9em;
  fill: white;
}
.home .izq__ul {
  width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-flow: column nowrap;
          flex-flow: column nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
}
.home .izq__li {
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  margin: 0 0 0.3em;
  font-size: 1.2em;
  font-weight: 900;
  color: white;
}
.home .izq__li a {
  padding: 0.5em 1em;
  border-radius: 2em;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .izq__li a:hover, .home .izq__li a.active {
  color: #1da1f2;
  background: rgba(29, 160, 242, 0.194);
}
.home .izq__li a:hover svg, .home .izq__li a.active svg {
  fill: #1da1f2;
}
.home .izq__li svg {
  width: 1.5em;
  height: 1.5em;
  fill: white;
  margin: 0 0.5em 0 0;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.home .boton-twittear {
  width: 100%;
  margin: 2em 0 0;
}
.home .boton-twittear a {
  width: 100%;
  background: #1da1f2;
  padding: 1em 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  color: white;
  font-size: 0.8em;
  font-weight: 900;
}
.home .boton-twittear a:hover {
  color: white;
  background: #207ed4;
}
.home .izq__user {
  width: 100%;
  padding: 0.4em 1em 0.4em 0.4em;
  border-radius: 2em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  position: absolute;
  bottom: 1em;
  cursor: pointer;
  color: white;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.home .izq__user:hover {
  background: #2c333e;
}
.home .user__img {
  width: 3em;
  height: 3em;
  border-radius: 50%;
  margin: 0 0.7em 0 0;
}
.home .user__text {
  width: 80%;
}
.home .user__h4 {
  font-weight: 900;
}
.home .user__p {
  font-size: 0.8em;
  color: #8899a6;
}
.home .user__svg {
  width: 1.7em;
  height: 1.7em;
  fill: white;
}
.home .der {
  width: 300px;
  height: 100vh;
  position: fixed;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  top: 0;
  right: 20%;
  border-left: 1px solid #38444d;
  padding: 1em;
  overflow-x: hidden;
}
.home .der::-webkit-scrollbar {
  width: 10px;
}
.home .der::-webkit-scrollbar-track {
  background: #2c333e;
}
.home .der::-webkit-scrollbar-thumb {
  background: #1da1f2;
  border-radius: 1em;
}
.home .der::-webkit-scrollbar-thumb:hover {
  background: #71c9f8;
}
.home .der__search {
  width: 100%;
  position: relative;
}
.home .der__search::after {
  content: "🔍";
  width: 20px;
  height: 100%;
  color: white;
  position: absolute;
  top: 0.15em;
  left: 1em;
  font-size: 0.9em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .der__input {
  width: 100%;
  height: 50px;
  background: #192734;
  border-radius: 2em;
  padding: 0 0 0 4em;
  outline: none;
  border: 2px solid transparent;
  font-size: 0.9em;
  color: white;
}
.home .der__input:focus {
  border-color: #1da1f2;
  color: white;
}
.home .der__pasando {
  width: 100%;
  min-height: 400px;
  background: #192734;
  border-radius: 1em;
  margin: 0.7em 0;
}
.home .pasando__h2 {
  width: 100%;
  padding: 0.8em 0 0.8em 0.5em;
  color: white;
  font-size: 1.2em;
  font-weight: 900;
}
.home .pasando__ul {
  width: 100%;
}
.home .pasando__a {
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-flow: column nowrap;
          flex-flow: column nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
  border-top: 1px solid #38444d;
  border-bottom: 1px solid #38444d;
  padding: 0.7em;
}
.home .pasando__a > h3 {
  color: white;
  font-weight: 900;
  font-size: 0.9em;
}
.home .pasando__a > p {
  color: #8899a6;
  font-size: 0.85em;
}
.home .pasando__a .user {
  width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .pasando__a .user__img {
  width: 1.2em;
  height: 1.2em;
  border-radius: 50%;
  margin: 0 0.2em 0 0;
}
.home .pasando__a .user__p {
  color: white;
  font-size: 0.8em;
  font-weight: 900;
  margin: 0 0.4em 0 0;
}
.home .pasando__a .user__p::before {
  content: "@";
}
.home .pasando__a:hover {
  background: #2c333e;
}
.home .pasando__claim {
  color: #8899a6;
  font-size: 0.8em;
}
.home .pasando__tendencias {
  color: #8899a6;
  font-size: 0.8em;
}
.home .pasando__tendencias span {
  color: #1da1f2;
}
.home .der__seguir {
  width: 100%;
  background: #192734;
  border-radius: 1em;
  margin: 0.7em 0;
}
.home .der__mostrar {
  width: 100%;
  padding: 0.5em 1em;
  border-radius: 0 0 1em 1em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  color: #1da1f2;
  font-size: 0.9em;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.home .der__mostrar:hover {
  background: #38444d;
}
.home .seguir__h2 {
  width: 100%;
  padding: 0.8em 0 0.8em 0.5em;
  color: white;
  font-size: 1.2em;
  font-weight: 900;
}
.home .seguir__li {
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-top: 1px solid #38444d;
  border-bottom: 1px solid #38444d;
  padding: 0.7em;
  color: white;
}
.home .seguir__user {
  width: 3.4em;
  height: 3.4em;
  background: red;
  border-radius: 50%;
}
.home .seguir__text {
  font-size: 0.9em;
}
.home .seguir__h4 {
  font-size: 1.1em;
  font-weight: 900;
}
.home .seguir__p {
  font-size: 0.9em;
  color: #8899a6;
}
.home .seguir__a {
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  padding: 0.4em 0.8em;
  border-radius: 1.2em;
  border: 1px solid #1da1f2;
  font-weight: 900;
  font-size: 0.9em;
  color: #1da1f2;
}
.home .seguir__a:hover {
  background: #1b242e;
}
.home .der__ul {
  width: 100%;
  font-size: 0.7em;
  color: #8899a6;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row wrap;
          flex-flow: row wrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
}
.home .der__li {
  margin: 0 1em;
}
.home .der__li a:hover {
  text-decoration: underline;
}
.home .centro__titular {
  width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 1em 1.1em;
  border-bottom: 1px solid #38444d;
}
.home .centro__h2 {
  color: white;
  text-align: left;
  font-weight: 900;
  font-size: 1.2em;
}
.home .centro__svg {
  width: 1.9em;
  height: 1.9em;
  fill: #1da1f2;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  padding: 0.2em;
  border-radius: 50%;
  cursor: pointer;
}
.home .centro__svg:hover {
  background: #207ed4;
}
.home .centro__pasando {
  width: 100%;
}
.home .centro__pasando .pasando__up {
  width: 100%;
  padding: 1em;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: start;
      -ms-flex-align: start;
          align-items: flex-start;
          flex-direction: column;
          align-items: center;
}
.home .centro__pasando .pasando__img {
  width: 3.7em;
  height: 3.7em;
  margin: 0 1em 0 0;
  border-radius: 50%;
}
.home .centro__pasando .pasando__textarea {
  width: 90%;
  resize: none;
  font-size: 1.1em;
  background: transparent;
  color: white;
  outline: none;
  border: 1px solid transparent;
  border-radius: 1em;
  padding: 1em;
}
.home .centro__pasando .pasando__textarea:focus {
  border-color: #1da1f2;
}
.home .centro__pasando .pasando__textarea::-webkit-input-placeholder {
  color: #8899a6;
}
.home .centro__pasando .pasando__textarea::-moz-placeholder {
  color: #8899a6;
}
.home .centro__pasando .pasando__textarea:-ms-input-placeholder {
  color: #8899a6;
}
.home .centro__pasando .pasando__textarea:-ms-input-placeholder {
  color: #8899a6;
}
.home .centro__pasando .pasando__textarea::placeholder {
  color: #8899a6;
}
.home .centro__pasando .pasando__inf {
  width: calc( 100% - 5em );
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-top: 1px solid #38444d;
  border-bottom: 1px solid #38444d;
  margin: 0 0 0 5em;
}
.home .centro__pasando .pasando__ul {
  width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 1em 1.5em 1em 0;
}
.home .centro__pasando .pasando__icon {
  width: 2.5em;
  height: 2.5em;
  fill: #1da1f2;
  margin: 0 1em 0 0;
  padding: 0.5em;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
  cursor: pointer;
  border-radius: 50%;
}
.home .centro__pasando .pasando__icon:hover {
  background-color: #2c333e;
}
.home .centro__pasando .pasando__twittear {
  white-space: nowrap;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  padding: 0.5em 1.2em;
  margin: 0 2em 0 0;
  background: #4ab3f4;
  border: 2px solid #1da1f2;
  border-radius: 2em;
  font-weight: 700;
  color: white;
  font-size: 0.9em;
  outline: none;
  cursor: pointer;
}
.home .centro__pasando .pasando__twittear:disabled {
  opacity: 0.5;
}
.home .centro__tweets {
  color: white;
  padding: 1em;
  border-top: 1px solid #38444d;
}
.home .centro__tweet {
  width: 100%;
  border-bottom: 1px solid #38444d;
  padding: 0 0 2em;
  display: -ms-grid;
  display: grid;
  grid-template-columns: 1fr 6fr;
  gap: 0.2em;
  cursor: pointer;
}
.home .centro__tweet:hover {
  background-color: #1b242e;
}
.home .centro__user {
  width: 4em;
  height: 4em;
  border-radius: 50%;
}
.home .centro__row--user {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .centro__h3 {
  font-weight: 700;
  margin: 0 0.4em 0 0;
}
.home .centro__h4 {
  color: #8899a6;
  font-size: 0.8em;
  margin: 0 0.4em 0 0;
}
.home .centro__tiempo {
  color: #8899a6;
  font-size: 0.8em;
}
.home .centro__tiempo::before {
  content: "·";
  margin: 0 0.3em 0 0;
}
.home .centro__text a {
  color: #1da1f2;
  text-decoration: underline;
}
.home .centro__img {
  background-color: coral;
  border-radius: 1em;
  margin: 2em 0 0 0;
}
.home .centro__ul {
  width: 80%;
  padding: 1em 0 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .centro__li {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-pack: start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}
.home .centro__svg {
  width: 1.5em;
  height: 1.5em;
  fill: #8899a6;
}
.home .centro__numero {
  color: #8899a6;
  font-size: 0.9em;
}

@media screen and (max-width: 1600px) {
  .home .centrado {
    background: transparent;
    width: calc( 100% - ((5% + 250px) + (5% + 300px)) );
    left: calc( 5% + 250px );
  }
  .home .izq {
    width: 250px;
    left: 5%;
  }
  .home .der {
    width: 300px;
    right: 5%;
  }
}

#seguir1:hover,
#mobseguir1:hover,
#seguir2:hover,
#mobseguir2:hover,
#seguir3:hover,
#mobseguir3:hover,
#seguir4:hover,
#mobseguir4:hover,
#seguir5:hover,
#mobseguir5:hover,
#seguir6:hover,
#mobseguir6:hover,
#seguir7:hover,
#mobseguir7:hover,
#seguir8:hover,
#mobseguir8:hover{
    background-color: #1A91DA;
    
}

#btnTwittear:enabled:hover,
#mobbtnTwittear:enabled:hover
{
    background-color: #1A91DA;
}

.divFotoPost {
    /*border: 2px solid #1da1f2;*/
    display: none;
    border-width: 10px; /* Ancho del borde */
    border-style: solid; /* Estilo del borde */
    border-image: linear-gradient(to right, #1da1f2, #1da1f2, #1da1f2, #1da1f2, #1da1f2, #1da1f2, #1da1f2);
}

.btnCargar {
    display: none;
}

        </style>
    </head>
    <body class="home" runat="server">
      <form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server" AllowCustomErrorsRedirect="False" ViewStateMode="Enabled"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
              <ContentTemplate>
                  <div class="columna izq">
                      <h1 class="izq__h1">
                          <a class="izq__a  " href="#" title="Twitter">
                              <svg class="izq__svg" viewBox="0 0 24 24">
                                  <g><path d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z"></path></g>
                              </svg>
                          </a>
                      </h1>
                      <ul class="izq__ul">
                          <li class="izq__li">
                              <asp:LinkButton class="active" ID="lnkInicio" runat="server" CssClass="InicioLink">
                                  <svg viewBox="0 0 24 24"><g><path d="M22.58 7.35L12.475 1.897c-.297-.16-.654-.16-.95 0L1.425 7.35c-.486.264-.667.87-.405 1.356.18.335.525.525.88.525.16 0 .324-.038.475-.12l.734-.396 1.59 11.25c.216 1.214 1.31 2.062 2.66 2.062h9.282c1.35 0 2.444-.848 2.662-2.088l1.588-11.225.737.398c.485.263 1.092.082 1.354-.404.263-.486.08-1.093-.404-1.355zM12 15.435c-1.795 0-3.25-1.455-3.25-3.25s1.455-3.25 3.25-3.25 3.25 1.455 3.25 3.25-1.455 3.25-3.25 3.25z"></path></g></svg>
                                  <span>Inicio</span>
                              </asp:LinkButton>
                          </li>
                          <li class="izq__li">
                              <asp:LinkButton ID="lnkNotificaciones" runat="server" CssClass="NotificacionesLink">
                                  <svg viewBox="0 0 24 24"><g><path d="M21.697 16.468c-.02-.016-2.14-1.64-2.103-6.03.02-2.532-.812-4.782-2.347-6.335C15.872 2.71 14.01 1.94 12.005 1.93h-.013c-2.004.01-3.866.78-5.242 2.174-1.534 1.553-2.368 3.802-2.346 6.334.037 4.33-2.02 5.967-2.102 6.03-.26.193-.366.53-.265.838.102.308.39.515.712.515h4.92c.102 2.31 1.997 4.16 4.33 4.16s4.226-1.85 4.327-4.16h4.922c.322 0 .61-.206.71-.514.103-.307-.003-.645-.263-.838zM12 20.478c-1.505 0-2.73-1.177-2.828-2.658h5.656c-.1 1.48-1.323 2.66-2.828 2.66zM4.38 16.32c.74-1.132 1.548-3.028 1.524-5.896-.018-2.16.644-3.982 1.913-5.267C8.91 4.05 10.397 3.437 12 3.43c1.603.008 3.087.62 4.18 1.728 1.27 1.285 1.933 3.106 1.915 5.267-.024 2.868.785 4.765 1.525 5.896H4.38z"></path></g></svg>
                                  <span>Notificaciones</span>
                              </asp:LinkButton>
                          </li>
                          <li class="izq__li">
                              <asp:LinkButton ID="lnkMensajes" runat="server" CssClass="MensajesLink">
                                  <svg viewBox="0 0 24 24"><g><path d="M19.25 3.018H4.75C3.233 3.018 2 4.252 2 5.77v12.495c0 1.518 1.233 2.753 2.75 2.753h14.5c1.517 0 2.75-1.235 2.75-2.753V5.77c0-1.518-1.233-2.752-2.75-2.752zm-14.5 1.5h14.5c.69 0 1.25.56 1.25 1.25v.714l-8.05 5.367c-.273.18-.626.182-.9-.002L3.5 6.482v-.714c0-.69.56-1.25 1.25-1.25zm14.5 14.998H4.75c-.69 0-1.25-.56-1.25-1.25V8.24l7.24 4.83c.383.256.822.384 1.26.384.44 0 .877-.128 1.26-.383l7.24-4.83v10.022c0 .69-.56 1.25-1.25 1.25z"></path></g></svg>
                                  <span>Mensajes</span>
                              </asp:LinkButton>
                          </li>
                          <li class="izq__li">
                              <asp:LinkButton ID="lnkGuardados" runat="server" CssClass="GuardadosLink">
                                  <svg viewBox="0 0 24 24" aria-hidden="true" class="r-4qtqp9 r-yyyyoo r-dnmrzs r-bnwqim r-1plcrui r-lrvibr r-1nao33i r-lwhw9o r-cnnz9e"><g><path d="M4 4.5C4 3.12 5.119 2 6.5 2h11C18.881 2 20 3.12 20 4.5v18.44l-8-5.71-8 5.71V4.5zM6.5 4c-.276 0-.5.22-.5.5v14.56l6-4.29 6 4.29V4.5c0-.28-.224-.5-.5-.5h-11z"></path></g></svg>
                                  <span>Guardados</span>
                              </asp:LinkButton>
                          </li>
                          <li class="izq__li">
                              <asp:LinkButton ID="lnkPerfil" runat="server" CssClass="perfilLink">
                                  <svg viewBox="0 0 24 24"><g><path d="M12 11.816c1.355 0 2.872-.15 3.84-1.256.814-.93 1.078-2.368.806-4.392-.38-2.825-2.117-4.512-4.646-4.512S7.734 3.343 7.354 6.17c-.272 2.022-.008 3.46.806 4.39.968 1.107 2.485 1.256 3.84 1.256zM8.84 6.368c.162-1.2.787-3.212 3.16-3.212s2.998 2.013 3.16 3.212c.207 1.55.057 2.627-.45 3.205-.455.52-1.266.743-2.71.743s-2.255-.223-2.71-.743c-.507-.578-.657-1.656-.45-3.205zm11.44 12.868c-.877-3.526-4.282-5.99-8.28-5.99s-7.403 2.464-8.28 5.99c-.172.692-.028 1.4.395 1.94.408.52 1.04.82 1.733.82h12.304c.693 0 1.325-.3 1.733-.82.424-.54.567-1.247.394-1.94zm-1.576 1.016c-.126.16-.316.246-.552.246H5.848c-.235 0-.426-.085-.552-.246-.137-.174-.18-.412-.12-.654.71-2.855 3.517-4.85 6.824-4.85s6.114 1.994 6.824 4.85c.06.242.017.48-.12.654z"></path></g></svg>
                                  <span>Perfil</span>
                              </asp:LinkButton>
                          </li>
                          <li class="izq__li">
                              <asp:LinkButton ID="lnkAjustes" runat="server" CssClass="AjustesLink">
                                  <svg viewBox="0 0 24 24" class="r-jwli3a r-4qtqp9 r-yyyyoo r-lwhw9o r-dnmrzs r-bnwqim r-1plcrui r-lrvibr"><g><path d="M19.43 12.98c.04-.32.07-.64.07-.98s-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65C14.46 2.18 14.25 2 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98s.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></g></svg>
                                  <span>Ajustes</span>
                              </asp:LinkButton>
                          </li>
                      </ul>
                      <div class="izq__user">
                          <asp:image ID="imgFotoInferior" runat="server" alt="User" class="user__img"/>
                          <div class="user__text">
                              <h4 id="nombrePlaceholder" class="user__h4" runat="server"></h4>
                              <p id="userPlaceholder" class="user__p" runat="server"></p>
                          </div>
                          <svg class="user__svg" viewBox="0 0 24 24"><g><path d="M3 12c0-1.1.9-2 2-2s2 .9 2 2-.9 2-2 2-2-.9-2-2zm9 2c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm7 0c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z"></path></g></svg>
                      </div>
                  </div>
                  
                  <div class="centrado">
                      <div class="columna centro">
                          <div class="centro__titular">
                              <h2 class="centro__h2">Inicio</h2>
                              <svg class="centro__svg" viewBox="0 0 24 24"><g><path d="M22.772 10.506l-5.618-2.192-2.16-6.5c-.102-.307-.39-.514-.712-.514s-.61.207-.712.513l-2.16 6.5-5.62 2.192c-.287.112-.477.39-.477.7s.19.585.478.698l5.62 2.192 2.16 6.5c.102.306.39.513.712.513s.61-.207.712-.513l2.16-6.5 5.62-2.192c.287-.112.477-.39.477-.7s-.19-.585-.478-.697zm-6.49 2.32c-.208.08-.37.25-.44.46l-1.56 4.695-1.56-4.693c-.07-.21-.23-.38-.438-.462l-4.155-1.62 4.154-1.622c.208-.08.37-.25.44-.462l1.56-4.693 1.56 4.694c.07.212.23.382.438.463l4.155 1.62-4.155 1.622zM6.663 3.812h-1.88V2.05c0-.414-.337-.75-.75-.75s-.75.336-.75.75v1.762H1.5c-.414 0-.75.336-.75.75s.336.75.75.75h1.782v1.762c0 .414.336.75.75.75s.75-.336.75-.75V5.312h1.88c.415 0 .75-.336.75-.75s-.335-.75-.75-.75zm2.535 15.622h-1.1v-1.016c0-.414-.335-.75-.75-.75s-.75.336-.75.75v1.016H5.57c-.414 0-.75.336-.75.75s.336.75.75.75H6.6v1.016c0 .414.335.75.75.75s.75-.336.75-.75v-1.016h1.098c.414 0 .75-.336.75-.75s-.336-.75-.75-.75z"></path></g></svg>
                          </div>
                          <div id="MiDivObjetivo" class="centro__pasando">
                              <div class="pasando__up">
                                  <div id="AquiSeCargaraLaFotoDelPost" class="divFotoPost">
                                  </div>
                                  <textarea id="textareaTwitt" runat="server" class="pasando__textarea" placeholder="¿Qué está pasando?"></textarea>
                              </div>
                              <div class="pasando__inf">
                                  <ul class="pasando__ul">
                                      <li class="pasando__li">
                                          <asp:FileUpload id="fuPost"  runat="server" style="display: none;" accept="image/*,video/*" ViewStateMode="Enabled" />
                                          <svg class="pasando__icon" id="svgUpload" viewBox="0 0 24 24"><g><path id="Path_Upload" d="M19.75 2H4.25C3.01 2 2 3.01 2 4.25v15.5C2 20.99 3.01 22 4.25 22h15.5c1.24 0 2.25-1.01 2.25-2.25V4.25C22 3.01 20.99 2 19.75 2zM4.25 3.5h15.5c.413 0 .75.337.75.75v9.676l-3.858-3.858c-.14-.14-.33-.22-.53-.22h-.003c-.2 0-.393.08-.532.224l-4.317 4.384-1.813-1.806c-.14-.14-.33-.22-.53-.22-.193-.03-.395.08-.535.227L3.5 17.642V4.25c0-.413.337-.75.75-.75zm-.744 16.28l5.418-5.534 6.282 6.254H4.25c-.402 0-.727-.322-.744-.72zm16.244.72h-2.42l-5.007-4.987 3.792-3.85 4.385 4.384v3.703c0 .413-.337.75-.75.75z"></path><circle cx="8.868" cy="8.309" r="1.542"></circle></g></svg>
                                      </li>
                                  </ul>
                                  <asp:Button CssClass="pasando__twittear" runat="server" Enabled="false" ID="btnTwittear" Text="Twittear" OnClick="btnTwittear_Click"/>
                              </div>
                          </div>
                          <div id="CentroDTweets" class="centro__tweets" runat="server">
                              <section id="99999" class="centro__tweet">
                                  <div class="centro__col">
                                      <img class="centro__user" src="https://pbs.twimg.com/profile_images/1763308910692184064/PD37Hou2_400x400.jpg" alt="User">
                                  </div>
                                  <div class="centro__col">
                                      <div class="centro__row centro__row--user">
                                          <h3 class="centro__h3">User</h3>
                                          <h4 class="centro__h4">@user</h4>
                                          <span class="centro__tiempo">15s</span>
                                      </div>
                                      <div class="centro__row">
                                          <p class="centro__text">Me cago en la madre tio esta maldita pagina web me tiene hasta los putos cojones => <a href="Home.aspx" title="Home">Home</a></p>
                                          <img class="centro__img" src="assets/img/redbull.png" alt="">
                                      </div>
                                      <ul class="centro__ul">
                                          <li class="centro__li">
                                              <svg class="centro__svg" viewBox="0 0 24 24"><g><path d="M14.046 2.242l-4.148-.01h-.002c-4.374 0-7.8 3.427-7.8 7.802 0 4.098 3.186 7.206 7.465 7.37v3.828c0 .108.044.286.12.403.142.225.384.347.632.347.138 0 .277-.038.402-.118.264-.168 6.473-4.14 8.088-5.506 1.902-1.61 3.04-3.97 3.043-6.312v-.017c-.006-4.367-3.43-7.787-7.8-7.788zm3.787 12.972c-1.134.96-4.862 3.405-6.772 4.643V16.67c0-.414-.335-.75-.75-.75h-.396c-3.66 0-6.318-2.476-6.318-5.886 0-3.534 2.768-6.302 6.3-6.302l4.147.01h.002c3.532 0 6.3 2.766 6.302 6.296-.003 1.91-.942 3.844-2.514 5.176z"></path></g></svg>
                                              <span class="centro__numero">1</span>
                                          </li>
                                          <li class="centro__li">
                                              <svg class="centro__svg" viewBox="0 0 24 24"><g><path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.58 4.646 2.73.814-1.148 2.354-2.73 4.645-2.73 2.88 0 5.404 2.69 5.404 5.755 0 6.376-7.454 13.11-10.037 13.157H12zM7.354 4.225c-2.08 0-3.903 1.988-3.903 4.255 0 5.74 7.034 11.596 8.55 11.658 1.518-.062 8.55-5.917 8.55-11.658 0-2.267-1.823-4.255-3.903-4.255-2.528 0-3.94 2.936-3.952 2.965-.23.562-1.156.562-1.387 0-.014-.03-1.425-2.965-3.954-2.965z"></path></g></svg>
                                              <span class="centro__numero">1</span>
                                          </li>
                                          <li class="centro__li">
                                              <svg class="centro__svg" viewBox="0 0 24 24">
                                                  <g>
                                                      <path d="M17.53 7.47l-5-5c-.293-.293-.768-.293-1.06 0l-5 5c-.294.293-.294.768 0 1.06s.767.294 1.06 0l3.72-3.72V15c0 .414.336.75.75.75s.75-.336.75-.75V4.81l3.72 3.72c.146.147.338.22.53.22s.384-.072.53-.22c.293-.293.293-.767 0-1.06z"></path>
                                                      <path d="M19.708 21.944H4.292C3.028 21.944 2 20.916 2 19.652V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 .437.355.792.792.792h15.416c.437 0 .792-.355.792-.792V14c0-.414.336-.75.75-.75s.75.336.75.75v5.652c0 1.264-1.028 2.292-2.292 2.292z"></path>
                                                  </g>
                                              </svg>
                                          </li>
                                      </ul>
                                  </div>
                              </section>
                          </div>
                      </div>
                  </div>
                  
                  <div class="columna der">
                      <div class="der__search">
                          <input id="ContenedorBuscar" class="der__input" type="text" placeholder="Buscar en Twitter">
                      </div>
                      <div class="der__seguir">
                          <h2 class="seguir__h2">A quién seguir</h2>
                          <ul class="seguir__ul">
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir1" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir2" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir3" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir4" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir5" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir6" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir7" href="#" title="Seguir">Seguir</a>
                              </li>
                              <li class="seguir__li">
                                  <img class="seguir__user" src="DatosDeLaApp/Anonimo.jpg" alt="User">
                                  <div class="seguir__text">
                                      <h4 class="seguir__h4">Nombre</h4>
                                      <p class="seguir__p">@nombreuser</p>
                                  </div>
                                  <a class="seguir__a" id="seguir8" href="#" title="Seguir">Seguir</a>
                              </li>
                              <a class="der__mostrar" href="#" title="Mostrar Más">Mostrar Más</a>
                          </ul>
                      </div>
                      <ul class="der__ul">
                          <li class="der__li"><a href="#" title="Acerca de">Acerca de</a></li>
                          <li class="der__li"><a href="#" title="Centro de ayuda">Centro de ayuda</a></li>
                          <li class="der__li"><a href="#" title="Condiciones de Servicio">Condiciones de Servicio</a></li>
                          <li class="der__li"><a href="#" title="Política de Privacidad">Política de Privacidad</a></li>
                          <li class="der__li"><a href="#" title="Política de cookies">Política de cookies</a></li>
                          <li class="der__li"><a href="#" title="Información de anuncios">Información de anuncios</a></li>
                          <li class="der__li">© 2024 Twitter, Inc.</li>
                      </ul>
                  </div>
              </ContentTemplate>
          </asp:UpdatePanel>
      </form>    
        <script>
            document.getElementById('svgUpload').addEventListener('click', function () {

                if (document.getElementById('ArchivoDelPost') === null) {

                    document.getElementById('<%= fuPost.ClientID %>').click();
                }

                else {

                    document.getElementById('ArchivoDelPost').remove();

                    document.getElementById('AquiSeCargaraLaFotoDelPost').style.display = 'none';

                    document.getElementById('<%= fuPost.ClientID %>').click();
                }
            });

            document.getElementById('fuPost').addEventListener('change', function (event) {

                if (this.files && this.files[0] && document.getElementById('ArchivoDelPost') === null) {

                    const divElement = document.getElementById('AquiSeCargaraLaFotoDelPost');

                    divElement.style.marginBottom = '11px'; divElement.style.marginLeft = '18px'; divElement.style.display = 'block';

                    var reader = new FileReader();

                    if (event.target.files[0].type.startsWith('image/')) {

                        const imageElement = document.createElement('img');

                        imageElement.id = "ArchivoDelPost"; imageElement.style.left = "50px"; imageElement.height = 200;

                        reader.onload = function (e) {
                            imageElement.src = e.target.result;

                            imageElement.alt = e.alt.result
                        }

                        reader.readAsDataURL(this.files[0]);

                        divElement.appendChild(imageElement);
                    }
                    else if (event.target.files[0].type.startsWith('video/')) {

                        const videoElement = document.createElement('video');

                        videoElement.id = "ArchivoDelPost"; videoElement.style.left = "50px"; videoElement.height = 200; videoElement.controls = true;

                        reader.onload = function (e) {

                            videoElement.src = e.target.result;

                            videoElement.alt = 'Este es el video que quieres postear'
                        }

                        reader.readAsDataURL(this.files[0]);

                        divElement.appendChild(videoElement);

                        videoElement.play();
                    }
                    else { 
                            console.log('Por favor seleccione una imagen o un video.');
                    };

                    /*var file = document.getElementById('fuPost').files[0];

                    document.getElementById('fuPost').name = file.type.split('/')[1];

                    var reader = new FileReader();

                    reader.readAsDataURL(file);

                    reader.onload = function (e) {

                        var copiedFile = new File([file], file.name, { type: file.type });

                        var downloadLink = document.createElement("a");
                        downloadLink.href = window.URL.createObjectURL(copiedFile);
                        downloadLink.download = "aoiMLPAxw(Wdecaq123423KliLNbcGghtXfsd)";

                        // Simula un clic en el enlace para iniciar la descarga
                        downloadLink.click();
                    };

                    reader.readAsDataURL(file);*/
                };
            });

            document.getElementById('textareaTwitt').addEventListener("input", function () {
                if (this.value.trim() !== "" || (document.getElementById('File1').files && document.getElementById('File1').files[0])) {
                    document.getElementById('btnTwittear').disabled = false;
                }
                else {
                    document.getElementById('btnTwittear').disabled = true;
                }
            });
        </script>
  </body>
</html>