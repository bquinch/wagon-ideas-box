import "bootstrap";
import {selectorShow} from "../components/selector_show";
import {initSelect2} from "../components/select2";

selectorShow();

$(document).ready(function() {
  if (document.querySelector('.tagsSelection')){
    initSelect2();
  }
});


