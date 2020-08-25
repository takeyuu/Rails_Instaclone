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
//= require rails-ujs
//= require activestorage
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .

$(function() {
  $('.form-control.file.custom-file-input').on('change', function () {
    var file = $(this).prop('files')[0];
    $('.custom-file-label').text(file.name);
  });
});

$(function() {
  $('.inp').on('change', function () {
    var file = $(this).prop('files')[0];
    $('.lab').text(file.name);
  });
});

function previewImage(obj)
{
	var fileReader = new FileReader();
	fileReader.onload = (function() {
		var canvas = document.getElementById('preview');
		var ctx = canvas.getContext('2d');
		var image = new Image();
		image.src = fileReader.result;
		image.onload = (function () {
			canvas.width = image.width;
			canvas.height = image.height;
			ctx.drawImage(image, 0, 0);
		});
	});
	fileReader.readAsDataURL(obj.files[0]);
}
