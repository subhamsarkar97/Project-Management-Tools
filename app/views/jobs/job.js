$(document).ready(function(){
    $('#sel :checkbox').each(function() { // Load previous values
        $(this).prop('checked', localStorage.getItem(this.id) === 'true');
    });
    $('#sel').click(function() {
        $('#sel :checkbox').each(function() { // Save current values
              localStorage.setItem(this.id, $(this).prop('checked'));
        });
    });
});