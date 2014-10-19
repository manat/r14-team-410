$('document').ready () ->
	$('.creator-dashboard a.sendemail').on 'click', () ->
		exam_id = $(this).attr('data-examid')
		$('#modal-assign form').attr('action', '/exams/' + exam_id + '/assign')