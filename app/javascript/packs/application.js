// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import { initMapbox, initMapbox2 } from '../plugins/init_mapbox';
import { initAutocomplete, initAutocompleteSearch } from '../plugins/init_autocomplete';

//= require aos
//= require flatpickr



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import Swiper from 'swiper/bundle';
import AOS from 'aos';
import "uploader";
import "jquery-ui";
import "jquery-ui/ui/widgets/sortable";
import 'jquery-ui/ui/disable-selection';

import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import { Estonian } from "flatpickr/dist/l10n/et.js"

// const swiper = new Swiper('.swiper-container', {
//     pagination: {
//       el: '.swiper-pagination',
//       type: 'fraction',
//     },
//     navigation: {
//       nextEl: '.swiper-button-next',
//       prevEl: '.swiper-button-prev',
//     },
// });



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initMapbox();
  initMapbox2();
  initAutocomplete();
  initAutocompleteSearch();
  flatpickr(".datepicker", {
      minDate: "today"
  })
  
  const swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
  });

  $(document).ready(function(){
    flatpickr('.flatpickr-input', {
      minDate: "today",
      "locale": Estonian,
      dateFormat: "j. F Y",
  });
  });

  $(function() {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
  
        reader.onload = function (e) {
          $('#img_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
  
    $("#mainphoto-upload").change(function(){
      $('#img_prev').addClass('show-prev')
      readURL(this);
    });
  });

  // Disable scrolling on number inputs
  $('form').on('focus', 'input[type=number]', function (e) {
    $(this).on('wheel.disableScroll', function (e) {
      e.preventDefault()
    })
  })
  $('form').on('blur', 'input[type=number]', function (e) {
    $(this).off('wheel.disableScroll')
  })
  

});

document.addEventListener('DOMContentLoaded', function() {
  $(function() {
    AOS.init({
      startEvent: 'turbolinks:load', // if you are using turbolinks
      duration: 1000,
      easing: "ease-in-out",
      once: true,
      mirror: false
    });
    // $("#input-id").fileinput();
   // swiper.init()
});
  
});

  



