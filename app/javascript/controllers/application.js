//= require jquery3
//= require popper
//= require bootstrap
//= require jquery_ujs
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
$(document).ready(()=>{
	$('.switchPropertyStatus').on('click', ()=>{
		$(this).closest('form')
		console.log('asdasd')
		$('#switch_property_status_form').submit()
	})
})