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
//= require tag-it.min
//= require foundation
//= require turbolinks
//= require sweet-alert-confirm
//= require_tree .

$(function() {
    $(document).foundation();
});

$(document).ready(function() {
    $('#tagit-field').tagit({
        singleField: true,
        singleFieldNode: $('#tags-field'),
        allowSpaces: true,
        removeConfirmation: true,
        tagSource: function(search, showChoices) {
            $.ajax({
                url: "/autocomplete-tags.json",
                data: search,
                success: function(data) {
                    showChoices(data);
                }
            });
        }
    });
});


$(document).ready(function() {
    $('#tagit-readonly').tagit({
        readOnly: true
    });
});
