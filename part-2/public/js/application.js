$(document).ready(function() {

  // ### Release 0: AJAX Post Addition
  $("section#sidebar").on("submit", "form#post_form", function(e){
    e.preventDefault();
    var form = $(this)

    $.ajax({
      url: form.attr("action"), // action="/posts"
      type: form.attr("method"), // method="post"
      data: form.serialize()
      // dataType: 'json'
    })
    .done(function(response){
      $("section#posts").prepend(response)
      form.trigger("reset")
      console.log('Form Submission Success. Data Saved') // for testing
    })
    .fail(function(){
      var error_msg = 'Submission Failed.  Invalid Data.'
      // form.append(error_msg)
      alert(error_msg)
      console.log(error_msg) // for testing
    })
    .always(function() {
      console.log("Successfully reached server.")
    })
  });

  // ### Release 1: Add Liking
  $('section#posts').on('submit', 'form.post_like', function(e){
    e.preventDefault()
    var form = $(this)
    var post = form.parent();

    $.ajax({
      method: "put",
      url: form.attr("action") // /posts/<%= post.id %>/like
    })
    .done(function(response){
      post.find("span.like_count").html(response);
      console.log("Successfully increased like count.");
    })
    .fail(function() {
      console.log("Failed to increase like count.");
    })
    .always(function() {
      console.log("Successfully reached server.");
    })
  });





});
