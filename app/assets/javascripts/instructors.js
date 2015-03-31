$(document).ready(function(){
	// $('#display-teachers').hide();
  $('#back-button').hide();		
});

var scrollY = 0;
var distance = 40;
var speed = 24;
function autoScrollTo(el) {
  var currentY = window.pageYOffset;
  var targetY = document.getElementById(el).offsetTop + 300;
  var bodyHeight = document.body.offsetHeight;
  var yPos = currentY + window.innerHeight;
  var animator = setTimeout('autoScrollTo(\''+el+'\')', speed);
  if(yPos > bodyHeight){
    clearTimeout(animator);
  } else {
    if(currentY < targetY - distance){
        scrollY = currentY + distance;
        window.scroll(0, scrollY);
      } else {
        clearTimeout(animator);
      }
  }
}

$('#all-teachers-button')


$(document).on('ready page:load', function() {
  // put your javascript here
});