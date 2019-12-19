import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css'
import 'select2-theme-bootstrap4/dist/select2-bootstrap.css'


const initSelect2 = () => {
  $('.tagsSelection').select2({
    placeholder: "Add tags",
    tags: true,
    tokenSeparators: [',', ' '],
    theme: "bootstrap"
  });
};

export { initSelect2 };
