$(document).on('turbolinks:load', function(){
  let countNum = String($("#input-text").val().length);
   $("#counter").text("残り" + (300 - countNum) + "文字");
 });

$(document).on('turbolinks:load', function(){
 $("#input-text").on("keyup", function() {
   let countNum = String($(this).val().length);
   $("#counter").text("残り" + (300 - countNum) + "文字");
 });
});
