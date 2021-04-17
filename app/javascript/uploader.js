$(document).on('turbolinks:load', () => {
  $("#sortableImgThumbnailPreview").sortable({
    connectWith: ".RearangeBox",
    start: function( event, ui ) { 
        $(ui.item).addClass("dragElemThumbnail");
        ui.placeholder.height(ui.item.height());
    },
      stop:function( event, ui ) {
        $(ui.item).removeClass("dragElemThumbnail");
        const orderStr = [];
        const items = $('.imgThumbContainer');
        items.each((i) => {
          orderStr.push(items[i].dataset.order)
        })
        $('#photos_order').val(orderStr.join(','));
    }
  });
  $("#sortableImgThumbnailPreview").disableSelection();
  document.getElementById('files').addEventListener('change', handleFileSelect, false);

  function handleFileSelect(evt) {
    let files = evt.target.files; 
    let output = document.getElementById("sortableImgThumbnailPreview");
    output.innerHTML = null;
    const orderStr = [];
    // Loop through the FileList and render image files as thumbnails.
    for (let i = 0, f; f = files[i]; i++) {
      // Only process image files.
      const currentIndex = i;
      orderStr.push(currentIndex + 1);
      if (!f.type.match('image.*')) continue;
      let reader = new FileReader();
      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          let imgThumbnailElem = `
            <div data-order="${currentIndex + 1}" class='RearangeBox imgThumbContainer'>
              <i class='fas fa-trash-alt imgRemoveBtn'></i>
              <div class='IMGthumbnail' >
                <img class="real-images" src='${e.target.result}' title='${theFile.name}'/>
              </div>
              <div class='imgName'>
                ${theFile.name}
              </div>
            </div>`; 
          output.innerHTML = output.innerHTML + imgThumbnailElem;
        };
      })(f);
      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }

    $('#photos_order').val(orderStr.join(','));
  }

  $(document).on('click','.imgRemoveBtn',function(e) {
    const container = $(this).parent();
    const id = container[0].dataset.order;
    const oldValues = $('#photos_order').val();
    const newValues = oldValues.split(',').filter(i => i !== id)
    $('#photos_order').val(newValues.join(','));
    container.replaceWith(null)
  });
});
