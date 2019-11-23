// micropostの文字カウント(300文字以内)
$(document).ready(function(){
  let countNum = String($("#input-text").val().length);
   $("#counter").text("残り" + (300 - countNum) + "文字");
});

$(document).ready(function(){
 $("#input-text").on("keyup", function() {
   let countNum = String($(this).val().length);
   $("#counter").text("残り" + (300 - countNum) + "文字");
 });
});

// mapの文字カウント(50文字以内)
$(document).ready(function(){
  let mapCountNum = String($("#input-map-text").val().length);
   $("#map-counter").text("残り" + (50 - mapCountNum) + "文字");
});

$(document).ready(function(){
 $("#input-map-text").on("keyup", function() {
   let mapCountNum = String($(this).val().length);
   $("#map-counter").text("残り" + (50 - mapCountNum) + "文字");
 });
});
