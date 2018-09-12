$(function(){
  function appendList(data){
   var image = (data.image != null) ? `<img style="margin-top: 10px" src="${data.image}"}` : ''
   var html = `<li class="message-container">
                <div class="message-container__top">
                  ${data.user_name}
                  <span class="date">
                    ${data.created_at}
                  </span>
                </div>
                ${image}
                <div class="message-container__message">
                  ${data.text}
                </div>
              </li>`
    $(".message-list").append(html)
  }

  function formReset(){
    $('#new_message')[0].reset();
    $("#new_message").find(".chatform__send-button").prop("disabled", false)
    $("#new_message").find(".chatform__send-button").prop("value", "Send")
  }

  $("#new_message").on("submit", function(e){
    e.preventDefault()
    var url = $(this).attr("action")
    var formData = new FormData(this)
    var alertMessage = $(".alert p")

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

        var scrollTarget = $(".chat").find($('.contents'))

        scrollTarget.animate({scrollTop: scrollTarget[0].scrollHeight}, 500, "swing");
        alertMessage.text("")
      }else{
        alertMessage.text(data.alert)
      }
      formReset()
    })
    .fail(function(data){
      alertMessage.text("メッセージの送信に失敗しました。")
      formReset()
    })

  })

  var latestMessage = window.latestMessage

  function reLoadPage(){
    var url = window.location.pathname

    $.ajax({
      type: "GET",
      url: url,
      data: {
          latestMessage: latestMessage
        },
      dataType: "json",
    })
    .done(function(messages){
      messages.forEach(function(message){
        appendList(message)
      })
    })

  }

  setInterval(reLoadPage, 5000)

})
