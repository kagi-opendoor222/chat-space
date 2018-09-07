$(function(){
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
  })
})
