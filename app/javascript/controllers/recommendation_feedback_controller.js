import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['thumbs'];

  highlightSelectedThumbs(selected_element) {
    this.thumbsTargets.forEach((element, index) => {
      if (element == selected_element) {
        element.classList.remove('fa-regular');
        element.classList.add('fa-solid');
      } else {
        element.classList.add('fa-regular');
        element.classList.remove('fa-solid');
      }
    })
  }

  selectScore(event) {
    event.preventDefault();
    const selectedThumbs = event.currentTarget.children[0];
    this.highlightSelectedThumbs(selectedThumbs);
    let feedback_score = document.getElementById('feedback_score');
    feedback_score.value = event.currentTarget.getAttribute('value');
  }

  submitForm(event) {
    event.preventDefault();
    let form = document.getElementById("recommendation-feedback-form");
    form.requestSubmit();
  }
}
