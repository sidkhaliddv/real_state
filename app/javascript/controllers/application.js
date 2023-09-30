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
	// $('.switchPropertyStatus').on('click', (event)=>{
	// 	$.ajax({
	// 		url: `/profile/properties/${event.target.id}/change_status`,
	// 		type: 'put',
	// 		data: {status: event.target.checked ? 1 : 0},
	// 		dataType: 'script',
	// 		success: (res)=>{
	// 			console.log('success')
	// 		}
	// 	})
	// })

	function showImage(input) {
		console.log('here')
		console.log(input)
		if (input.files && input.files[0]) {
			console.log('appending')
			var reader = new FileReader();

			reader.onload = function (e) {
				var img = $('<img />', {
					src: e.target.result,
					alt: 'house image'
				});
				img.appendTo($('#form_field'))
			}
			reader.readAsDataURL(input.files[0])
		}
	}

	$('#form_images').on('change', ()=>{
		console.log('change')
		$(this).attr('style', 'background-color: red !important');
		showImage($(this))
	})
})
