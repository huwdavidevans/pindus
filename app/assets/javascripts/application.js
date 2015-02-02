// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//
//= require foundation
//
//= require tag-it.min
//= require sweet-alert-confirm
//= require jquery.colorbox
//
//= require turbolinks

var ready;
ready = function() {
    $(document).foundation();

    $('#tagit-field').tagit({
        singleField: true,
        singleFieldNode: $('#tags-hidden-field'),
        allowSpaces: true,
        removeConfirmation: true,
        tagSource: function(search, showChoices) {
            $.ajax({
                url: "/autocomplete-tags.json",
                data: search,
                success: function(choices) {
                    showChoices(choices);
                }
            });
        }
    });

    $('#tags-hidden-field').change(function() {
        $('form.edit_pic').submit();
    });

    $('#tags-hidden-field').closest('form').on('ajax:success', function(data) {
        var saveMessage = $(document.createElement('i')).text(' ').addClass('fa fa-floppy-o').addClass('tagit-ajax-message').addClass('success');
        $('#tagit-field').after(saveMessage);
        setTimeout(function(){saveMessage.fadeOut(300, function(){$(this).remove()});}, 700);
    });

    $('#tagit-readonly').tagit({
        readOnly: true
    });

    $('a.colorbox').colorbox();
};

$(document).ready(ready);
$(document).on('page:load', ready)
