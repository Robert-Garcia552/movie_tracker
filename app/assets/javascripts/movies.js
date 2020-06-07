$(document).ready(function() {
  $('.card').on('click', '.far.fa-bookmark', function() {
    let userId = $(this).closest('.card').data().userId;
    let movieId = $(this).closest('.card').data().movieId;

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
        $(`.card[data-movie-id='${movieId}']`)
          .find(`.fa-bookmark`)
          .removeClass('far fa-bookmark fa-stack-1x fa-inverse')
          .addClass('fas fa-bookmark fa-stack-1x fa-inverse')
        $(`.card[data-movie-id='${movieId}'] .favorite`).removeClass('hidden')
      }
    });
  });

  $('.card').on('click', '.fas.fa-bookmark', function() {
    let userId = $(this).closest('.card').data().userId;
    let movieId = $(this).closest('.card').data().movieId;

    $.ajax({
      method: "GET",
      url: "/watched_movies/delete",
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
        $(`.card[data-movie-id='${movieId}']`)
          .find(`.fa-bookmark`)
          .removeClass('fas fa-bookmark fa-stack-1x fa-inverse')
          .addClass('far fa-bookmark fa-stack-1x fa-inverse')
        $(`.card[data-movie-id='${movieId}'] .favorite`).addClass('hidden')
      }
    });
  });

  $('.card').on('click', '.far.fa-heart', function() {
    let userId = $(this).closest('.card').data().userId;
    let movieId = $(this).closest('.card').data().movieId;

    $.ajax({
      method: "PUT",
      url: "/watched_movies/update_favorite",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        watched_movie: {
          user_id: userId,
          movie_id: movieId,
          favorite: true
        },
      },
      success: function(data) {
        $(`.card[data-movie-id='${movieId}']`)
          .find('.fa-heart')
          .removeClass('far fa-heart fa-stack-1x fa-inverse')
          .addClass('fas fa-heart fa-stack-1x fa-inverse')
      }
    });
  });

  $('.card-body').on('click', '.fas.fa-heart', function() {
    let userId = $(this).closest('.card').data().userId;
    let movieId = $(this).closest('.card').data().movieId;

    $.ajax({
      method: "PUT",
      url: "/watched_movies/update_favorite",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        watched_movie: {
          user_id: userId,
          movie_id: movieId,
          favorite: false     
        },
      },
      success: function(data) {
        $(`.card[data-movie-id='${movieId}']`)
          .find('.fa-heart')
          .removeClass('fas fa-heart fa-stack-1x fa-inverse')
          .addClass('far fa-heart fa-stack-1x fa-inverse')
      }
    });
  });
});
