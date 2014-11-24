var image;

$(document).bind('ready page:load',function() {
    var counter = 1;


    function loadImage() {
        counter += 1;

        /////////JQUERY ATTACH NEW HTML TO DOM



        $('#streamsTable').find('tbody')

        .append($('<div class="sort-cell">')
            .append($("<canvas id='canvas" + counter + "' rel='"+counter+"'>"))
            // .append($("<img src='grid.png' rel='"+counter+"' id='grid'>"))
            .append($("<div rel='"+counter+"' class='scale'>"))
            .append($("<div rel='"+counter+"' class='rotate'>"))
            .append($("<div rel='"+counter+"' class='sort-handle' id='sort-handle" + counter + "'></div>"))
            .append($("<div rel='"+counter+"' class='image-settings' id='image-settings" + counter + "'></div>"))
        );



        ///////FABRIC MAKE CANVAS AND IMAGE INSTANCE

var canvas = new fabric.Canvas('canvas' + counter);
        canvas.setHeight(640);
        canvas.setWidth(640);
        canvas.setBackgroundColor('black');


////HIDE ROTATE AND SCALE

$('.scale').hide();
$('.rotate').hide();


////LOAD IMAGE


document.getElementById('imgLoader').onfocus = function handleImage(e) {
    var reader = new FileReader();
    reader.onload = function (event) { 
        var imgObj = new Image();
        imgObj.src = event.target.result;
        imgObj.onload = function () {
            // start fabricJS stuff
            
            image = new fabric.Image(imgObj);
            image.set({
              left: 320,
              top: 320,
            originX: 'center',
            originY: 'center',
            hasBorders : false,
            hasControls : false,
            hasRotatingPoint : false,

            });


            canvas.add(image);
            canvas.setActiveObject(image);
            // image.lockMovementX = true;
            // image.lockMovementY = true;

            
            // var gridElement = document.getElementById('.grid');
            // var gridInstance = new fabric.Image(gridElement, {
            // left: 0,
            //   top: 0,
            // });
            // canvas.add(gridInstance );

            
            // end fabricJS stuff
        }
        
    }
    reader.readAsDataURL(e.target.files[0]);

}




        canvas.calcOffset();


        $('.scale[rel='+counter+']').slider({
            animate: "fast",
            orientation: "vertical",
            min: 700,
            max: 1000,
            step: 1,
            value: 800,
            slide: function(event, ui) {
                var activeObject = canvas.getActiveObject();
                if (activeObject) {
                    activeObject.height = ui.value;
                    activeObject.width = ui.value;
                    activeObject.setCoords();
                    canvas.renderAll();


                }
            }

        });

        $('.rotate[rel='+counter+']').slider({
            orientation: "vertical",
            animate: "fast",
            min: -30,
            max: 30,
            step: 1,
            value: 0,
            slide: function(event, ui) {
                var activeObject = canvas.getActiveObject();
                if (activeObject) {
                    activeObject.angle = ui.value;
                    activeObject.setCoords();
                    canvas.renderAll();

                }
            }
        });

    
$('.image-settings[rel='+counter+']').click(function() {
  $('.scale').toggle();
  $('.rotate').toggle();
  $('.sort-handle').toggle();
  // lockImages();
  // $('#canvas [rel='+counter+']').image.lockMovementX = true;
  // image.lockMovementX = false;
  // image.lockMovementY = false;


});




    };

 


    //////SORTABLE/////

    $("table tbody").sortable({
        handle: '.sort-handle',
        cancel: '',
        axis: 'y',
        placeholder: "placeholderX"

    }).disableSelection();

  //   function hideButtons(){

  //     $('.scale[rel='+counter+']').hide( "fast", function() {
  //   alert( "Animation complete." )
  //   });

  //      $('.rotate[rel='+counter+']').hide( "fast", function() {
  //   alert( "Animation complete." )
  //   });

  // };






    // $('.image-settings').click(hideButtons);


    $('#imgLoader').click(loadImage);


  

});

