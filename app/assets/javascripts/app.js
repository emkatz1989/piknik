//NEW CANVAS //////////////

var canvas1 = new fabric.Canvas('imageCanvas', {
    backgroundColor: 'rgb(240,240,240)'
});

var imageLoader = document.getElementById('imageLoader');
imageLoader.addEventListener('change', handleImage, false);

function handleImage(e) {
    var reader = new FileReader();
    reader.onload = function (event) {
        var img = new Image();
        img.onload = function () {
            var imgInstance = new fabric.Image(img, {
                scaleX: 1,
                scaleY: 1
            })
            canvas1.add(imgInstance);
        }
        img.src = event.target.result;
    }
    reader.readAsDataURL(e.target.files[0]);
}


////save image

var imageSaver = document.getElementById('imageSaver');
imageSaver.addEventListener('click', saveImage, false);

function saveImage(e) {
    this.href = canvas.toDataURL({
        format: 'jpeg',
        quality: 0.8
    });
    this.download = 'test.png'
}

//////////////////////// SORTABLE //////////

    $("table tbody").sortable({
    handle: '#sort-handle',
    cancel: '',
    axis: 'y',
    placeholder: "placeholderX"

}).disableSelection();


//////////////CREATE CANVAS     

var canvas = new fabric.Canvas('c');

var imgElement = document.getElementById('selfie');

var imgInstance = new fabric.Image(imgElement, {
  left: 0,
  top: 0,
  lockUniScaling: true,
  centeredRotation: true,
  centeredScaling: true,
  originX: 'center',
  originY: 'center',
});

canvas.calcOffset();



///////////DUMB BOUNDING BOX


boundingBox = new fabric.Rect({
    id: 'bounding-box',
    width: 1000,
    height: 1000,
    left: -180,
    top: -180,
    hasBorders: false,
    hasControls: false,
    lockMovementX: true,
    lockMovementY: true,
    evented: false,
    stroke: "black",
    fill: "black",
    selectable: false
});

this.canvas.add(boundingBox);


/////////////ADDING IMAGE TO CANVAS

canvas.add(imgInstance);
imgInstance.center();
imgInstance.centeredRotation = true;
imgInstance.centeredScaling = true;
canvas.setActiveObject(imgInstance);


//////////ADDING GRID TO CANVAS (NOT FUNCTIONAL YET)

addGrid = new fabric.Image({
id: 'grid',
width: 640,
height: 640,
left: 0,
top: 0,
hasBorders: false,
hasControls: false,
lockMovementX: true,
lockMovementY: true,
evented: false,
stroke: "black",
fill: "black",
selectable: false
})


/////////////ROTATION SLIDER 

$(function() {
  $('.rotate').slider({
    orientation: "vertical",
    min: -30,
    max: 30,
    step: 1,
    value: 0,
    slide: function( event, ui ) {
      var activeObject = canvas.getActiveObject();
      if(activeObject) {
        activeObject.angle = ui.value;
        activeObject.setCoords();
        canvas.renderAll();
        logCanvas(canvas);
        storeCanvas(canvas);
      }
    }
  });
});

/////////////ROTATION SLIDER 

$(function() {
  $('.scale').slider({
    orientation: "vertical",
    min: 700,
    max: 1000,
    step: 1,
    value: 800,
    slide: function( event, ui ) {
      var activeObject = canvas.getActiveObject();
      if(activeObject) {
        activeObject.height = ui.value;
        activeObject.width = ui.value;
        activeObject.setCoords();
        canvas.renderAll();
        logCanvas(canvas);
        storeCanvas(canvas);
        
      }
    }

  });
});





//////LOCAL STORAGE!!!!

function storeCanvas(canvasName){
localStorage.setItem("canvasX", JSON.stringify(canvasName));
}

function logCanvas(canvasName){
console.log(JSON.stringify(canvasName));
}

var sorted = $( "table tbody" ).sortable( "serialize", { key: "sort" } );




