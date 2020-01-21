$(document).ready(function() {
  $('.card-body').on('click', '.far', function() {
    let userId = $(this).data().userId;
    let movieId = $(this).data().movieId;

    $.ajax({
      method: "POST",
      url: "/watched_movies/add",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        watched_movie: {
          user_id: userId,
          movie_id: movieId
        }
      },
      success: function(data) {
        $(`[data-movie-id='${movieId}']`).removeClass('far fa-sticky-note fa-3x').addClass('fas fa-sticky-note fa-3x')
      }
    });
  });

  $('.card-body').on('click', '.fas', function() {
    let movieId = $(this).data().movieId;

    $.ajax({
      method: "GET",
      url: "/watched_movies/delete",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        movie_id: $(this).data().movieId
      },
      success: function(data) {
        $(`[data-movie-id='${movieId}']`).removeClass('fas fa-sticky-note fa-3x').addClass('far fa-sticky-note fa-3x')
      }
    });
  });
});
