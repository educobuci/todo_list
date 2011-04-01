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
    $(".flash").fadeOut(3000);
  }
);