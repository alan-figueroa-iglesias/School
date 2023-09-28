// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

/* global bootstrap: false */

// Function for mark all checkboxes in the groups assignments
document.addEventListener('DOMContentLoaded', function () {
    const selectAllCheckbox = document.getElementById('select-all-checkbox');
    const groupCheckboxes = document.querySelectorAll('input[name="assignment_teacher[group][]"]');

    selectAllCheckbox.addEventListener('change', function () {
        groupCheckboxes.forEach(function (checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
        });
    });

    groupCheckboxes.forEach(function (checkbox) {
        checkbox.addEventListener('change', function () {
        // Desmarcar "Seleccionar todo" si no todos los checkboxes están marcados
        if (!checkbox.checked) {
            selectAllCheckbox.checked = false;
        }
        });
    });
});