$(function(){
  function appendList(data){
   var html = `<li class="message-container">
                <div class="message-container__top">
                  ${data.user_name}
                  <span class="date">
                    ${data.created_at}
                  </span>
                </div>
                ${(data.image != null) ? `<img style="margin-top: 10px" src="${data.image}"}` : ''}
                <div class="message-container__message">
                  ${data.text}
                </div>
              </li>`
    $(".message-list").append(html)
  }
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
    .done(function(data){
      if(data.alert == null){
        appendList(data)
        $(".chat").find($('.contents')).animate({scrollTop: $(".chat").find($('.contents'))[0].scrollHeight}, 500, "swing");
        $(".alert p").text("")
      }else{
        $(".alert p").text(data.alert)
      }
      $('#new_message')[0].reset();
      $("#new_message").find(".chatform__send-button").prop("disabled", false)
      $("#new_message").find(".chatform__send-button").prop("value", "send")
    })
    .fail(function(data){
      console.log(data)
      $(".alert p").text("メッセージの送信に失敗しました。")
      $("#new_message").find(".chatform__send-button").prop("disabled", false)
      $("#new_message").find(".chatform__send-button").prop("value", "send")
    })
  })
})
