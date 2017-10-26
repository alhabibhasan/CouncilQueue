$(document).ready(function() {


    var addQueueForm = $("#formToAdd");
    var buttonToShowForm = $("#addToQueue");

    // hide the ind form until selected.
    var indivForm = $("#indForm");
    indivForm.hide();

    var orgForm = $("#orgForm");
    orgForm.hide();

    $('input[type=radio][name=userType]').on('change', function() {
        switch ($(this).val()) {
            case 'Citizen':
                indivForm.fadeIn();
                orgForm.fadeOut();
                break;
            case 'Organization':
                indivForm.fadeOut();
                orgForm.fadeIn()
                break;
            case 'Anonymous':
                indivForm.fadeOut();
                orgForm.fadeOut();
                break;
        }
    });





    // Find and hide the form to add to the queue
    addQueueForm.hide();

    buttonToShowForm.click(function() {
        addQueueForm.fadeToggle();
    });
});