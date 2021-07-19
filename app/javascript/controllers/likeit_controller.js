import {
  Controller
} from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static values = {
    likepath: String,
    dislikepath: String,
    resetpath: String,
  }
  static targets = ['display']

  post(path) {
    Rails.ajax({
      type: 'post',
      dataType: 'json',
      url: path,
      success: (data, _status, xhr) => {
        this.displayTarget.innerHTML = data.html
      }
    })
  }

  reset() {
    this.post(this.resetpathValue)
  }

  like() {
    this.post(this.likepathValue)
  }

  dislike() {
    this.post(this.dislikepathValue)
  }
}
