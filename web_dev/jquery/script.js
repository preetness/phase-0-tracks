$(document).ready(function() {
  $('h1').click(function(){
    $('h1').text('Hipster AF!');
    $('h2').text('Hand me a PBR!')
  });
});

$('img').hover(function(){
  $('p').remove();
});

$('img').click(function(){
  $('img').animate({height:"1000px"});
  $('h1').css("color", "#F28281");
  $('h2').css("color", "#12BAA0");
  $('h3').css("color", "#F7E9BA");
  $('h1').css("font-size", "65px");
  $('h2').css("font-size", "45px");
  $('h3').css("font-size", "25px");
  $('.container').css("padding-top", "0%");
  $('img').css("margin", "0 auto");
});
