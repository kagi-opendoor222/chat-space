$(function(){
  function buildHtml(user){
    var html =
    `<div class="chat-group-user clearfix">
       <p class="chat-group-user__name">${user.name}</p>
       <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
     </div>`
    $("#user-search-result").append(html)
  }

  $("#user-search-field").on("keyup",function(){
    var input = $("#user-search-field").val();
    var url = "/users";
    console.log(input);
    $.ajax({
      type: "GET",
      url: url,
      data: {
        keyword: input
      },
      dataType: "json"
    })
    .done(function(users){
      users.forEach(function(user){
        buildHtml(user)
      })
    })
    .fail(function(users){
      $(".alert p").text("エラーが発生しました。")
    })
  })
  })
})
