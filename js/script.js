//Script para ctivar el menu lateral izquierdo con materialize 

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, {
        edge: 'left',
        draggable: true,
        inDuration: 250,
        outDuration: 200,
        onOpenStart: null,
        onOpenEnd: null,
        onCloseStart: null,
        onCloseEnd: null,
        preventScrolling: true
    });
  });

  // Or with jQuery

  /*$(document).ready(function(){
    $('.sidenav').sidenav();
  });*/
/*Para Drowbo*/ 
 /*document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, {});
  });*/
  $(".dropdown-trigger").dropdown();
  

  // Or with jQuery

  /*$('.dropdown-trigger').dropdown();*/