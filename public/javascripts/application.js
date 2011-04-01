function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".item").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
}

$(document).ready(
  function(){
    bind_actions();
    $(".flash").fadeOut(3000);
  }
);

function bind_actions()
{
  $("a[data-remote]").live("ajax:success", function(e)
  {
    var link = $(this);
    link.parent().hide();
  });
}