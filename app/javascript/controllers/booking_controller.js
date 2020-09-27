import { Controller } from "stimulus"
import * as _ from "underscore/underscore";

export default class extends Controller {
    static targets = [ "vehicle", "from", "to", "submit" ]

    initialize() {
        this.submitTarget.classList.toggle('bg-teal-400', false);
        this.submitTarget.classList.toggle('hover:bg-teal-500', false);
        this.submitTarget.disabled = false;

        this.search = _.debounce(this.search, 300);
    }

    connect() {

    }

    search() {

    }
}