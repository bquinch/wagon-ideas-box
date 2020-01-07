import "bootstrap";
import {selectorShow} from "../components/selector_show";
import {selectorProfile} from "../components/selector_profile";
import {initSelect2} from "../components/select2";

selectorShow();
selectorProfile();

$(document).ready(function() {
  if (document.querySelector('.tagsSelection')){
    initSelect2();
  }
});


