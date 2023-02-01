import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    update_filters(event) {
        event.preventDefault();

        const element = event.currentTarget;
        let form_input_target = element.getAttribute('input-target');
        form_input_target = document.getElementById(form_input_target);
        form_input_target.value = element.getAttribute('value');
        let form = document.getElementById('filter-form');

        form.requestSubmit();
    }
}
