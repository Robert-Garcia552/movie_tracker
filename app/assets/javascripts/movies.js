$(document).ready(function() {
  $('.card-body').on('click', '.far', function() {
    let userId = $(this).data().userId;
    let movieId = $(this).data().movieId;

    $.ajax({
      method: "POST",
      url: "/favorites/add",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        favorite: {
          user_id: userId,
          movie_id: movieId
        }
      },
      success: function(data) {
        $(`[data-movie-id='${movieId}']`).removeClass('far fa-thumbs-up fa-3x').addClass('fas fa-thumbs-up fa-3x')
      }
    });
  });

  $('.card-body').on('click', '.fas', function() {
    let movieId = $(this).data().movieId;

    $.ajax({
      method: "GET",
      url: "/favorites/delete",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        movie_id: $(this).data().movieId
      },
      success: function(data) {
        $(`[data-movie-id='${movieId}']`).removeClass('fas fa-thumbs-up fa-3x').addClass('far fa-thumbs-up fa-3x')
      }
    });
  });
});