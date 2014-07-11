bespoke.from('article', {
  keys: true,
  touch: true,
  bullets: 'li, .bullet',
  scale: true,
  hash: true,
  progress: true,
  state: true,
  forms: true
});

//hide or display screen when b key is pressed
$("body").keypress(function(e) {
  console.log(e.keyCode);
  if(e.keyCode==66 || e.keyCode==98){
    $(".black-hide").fadeToggle('slow/400/fast', function() {
      
    });
  }
});

$("body").on('click', function(e) { 
   if( e.which == 2 ) {
      e.preventDefault();
      $(".black-hide").fadeToggle('slow/400/fast', function() {
      
      });
   }
});