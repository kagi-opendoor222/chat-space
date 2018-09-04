$(function(){
  $("#new_message").on("submit", function(e){
    e.preventDefault()
    url = $(this).attr("action")
    var formData = new FormData(this)
    $.ajax({
      type: "POST",
      data: formData,
      url: url,
      dataType: "json",
      processData: false,
      contentType: false
    })
  })
})
