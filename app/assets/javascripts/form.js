$(function(){
  function buildHtml(user){
    var html =
    `<div class="chat-group-user clearfix">
       <p class="chat-group-user__name">${user.name}</p>
       <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
     </div>`
    $("#user-search-result").append(html)
  }
  function appendGroupUser(user){
    var html =
    `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
      <input name='group[user_ids][]' type='hidden' value='${user.userId}'>
      <p class='chat-group-user__name'>${user.userName}</p>
      <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
    </div>`
    $("#chat-group-users").append(html)
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
      $("#user-search-result").empty()
      users.forEach(function(user){
        buildHtml(user)
      })
    })
    .fail(function(users){
      $(".alert p").text("エラーが発生しました。")
    })
  })
  $(document).on("click", ".chat-group-user__btn--add", function(){
    var user = $(this).data()
    appendGroupUser(user)
    $(this).parent().remove()
  })
})
