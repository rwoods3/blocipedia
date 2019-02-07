function show_fees(element, current_role) {
	if(element.value == 'premium' && current_role == 'standard') {
		$('.upgrade-info').css('display', 'inline');
	}
	else if(element.value == 'standard' && current_role == 'premium') {
		$('.downgrade-info').css('display', 'inline');
	}
	else {
		$('.upgrade-info').css('display', 'none');
		$('.downgrade-info').css('display', 'none');
	}
}
