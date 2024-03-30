<h1 align="center">👙 neko_pedmenu</h1>

<p align="center">
  <img src="https://img.shields.io/github/repo-size/imkuroneko/neko_pedmenu?style=flat"/> &nbsp;
  <img src="https://img.shields.io/github/languages/top/imkuroneko/neko_pedmenu?style=flat"/> &nbsp;
  <img src="https://img.shields.io/github/last-commit/imkuroneko/neko_pedmenu?color=pink&style=flat"/>
</p>

Sistema para otorgar peds permanentemente (registro en BD) o de forma temporal (hasta el próximo reinicio o restarteo del script) para servidores de FiveM basado en QBCore;


<br>

### 📦 Dependencias
- `oxmysql`
- `ox_lib`
- `illenium-apearance`, `fivem-appearace` o cualquiera que cuente con una función para volver a la skin original

<br>

### 🦄 Detalles
- Todos los items deben estar registrados en `ox_inventory/data/items.lua` (de usar este inventario)
- Los items de menú deben tener el nombre de `menu_{nombrefaccion}` (ej: `menu_pizzeria`)
- Los items para craftear la comida o bebida (se pueden setear como `''` o `false` si no se utilizará)
- Todos los textos se encuentran en `locales/es.json` por si desees agregar otros idiomas o modificar algo a tu gusto.

<br>

> [!NOTE]
> - El proyecto utiliza el sistema de traducciones de **ox_lib**, para que funcione deberás agregar en tu archivo `.cfg` lo siguiente: `setr ox:locale es`
> - La mayor parte del proyecto ahora se encuentra funcionando gracias a **ox_lib**

<br>

<h3 align="center">Comandos</h3>
<table>
    <tr> <th> Menú de entrega de PEDs (/giveped) </th> <th> Menú de uso de PEDs </th> </tr>
    <tr>
        <td> <img src="https://github.com/imkuroneko/neko_pedmenu/assets/20273059/5500956e-ca83-4cc0-a446-328941d170ee" alt="Menú de entrega de PEDs"/> </td>
        <td> <img src="https://github.com/imkuroneko/neko_pedmenu/assets/20273059/853518e9-27ea-4a39-830d-7f809e5ce183" alt="Menú de uso de PEDs"/> </td>
    </tr>
</table>

-----

<p align="center">
  <a href="https://kuroneko.im" target="_blank">
    <img src="https://kuroneko.im/web/assets/images/profile.png" width="120">
  </a>
</p>
