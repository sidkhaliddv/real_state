import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="property"
export default class extends Controller {
  connect() {
    console.log(this.propertyStatusTarget.value)
  }
  static targets = ['propertyStatus']

  update_status() {
    console.log(this.propertyStatusTarget.id)
    $.ajax({
      url: `/profile/properties/${this.propertyStatusTarget.id}/change_status`,
      type: 'put',
      dataType: 'json',
      data: {
        status: this.propertyStatusTarget.checked ? 1 : 0
      },
      success: (res)=>{
        console.log('success', res)
      },
      error: (err) => {
        console.log('error', err)
      }
    })
  }
}
