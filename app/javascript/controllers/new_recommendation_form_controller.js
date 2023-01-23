import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['position', 'tier', 'role'];

  initialize() {
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('typewriter');
            return;
        }

            entry.target.classList.remove('typewriter');
        });
    });
    var texts = document.getElementsByClassName('typewriter');
    for (let item of texts) {
      observer.observe(item);
    }
  }

  updateVisualGrayscaleSelection = function (selected_element, elements) {
    elements.forEach((element, index) => {
      if (element !== selected_element) {
        element.classList.add('hoverable-grayscaled-card');
      } else {
        element.classList.remove('hoverable-grayscaled-card');
      }
    });
  }

  enableSubmitButtonIfAllSectionsAreFilledByUser() {
    let all_sections_are_filled = true;
    for (let item of document.getElementById("recommendation-form").children) {
      all_sections_are_filled = all_sections_are_filled && (item.value !== "");
    }

    if (all_sections_are_filled) {
      let submitButton = document.getElementById("submit-recommendation-request-button");
      submitButton.classList.remove("disabled");
      submitButton.setAttribute("aria-disabled", "false");
    }
  }

  selectField(event, form_to_fill, targets) {
    event.preventDefault();
    const selected_element = event.currentTarget;
    this.updateVisualGrayscaleSelection(selected_element, targets);
    document.getElementById(form_to_fill).value = selected_element.getAttribute('value');
    document.getElementById(selected_element.getAttribute('href').slice(1)).scrollIntoView({behavior: 'smooth'}, true);

    this.enableSubmitButtonIfAllSectionsAreFilledByUser();
  }

  selectPosition(event) {
    this.selectField(event, 'form-position', this.positionTargets);
  }

  selectTier(event) {
    this.selectField(event, 'form-tier', this.tierTargets);
  }

  selectRole(event) {
    this.selectField(event, 'form-role', this.roleTargets);
  }

  submitRecommendationRequest(event) {
    document.getElementById('recommendation-form').requestSubmit();
  }
}
