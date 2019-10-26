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

$(document).on('turbolinks:load', function(){
  $fileField = $('#file')

  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
