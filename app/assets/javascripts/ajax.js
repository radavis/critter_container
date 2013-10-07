var submit_pic_upvote = function(id){
  $.ajax({
    type: "GET",
    url: '/pictures/' + id + '/upvote.json',
    dataType: 'json',
    success: function(msg) {
      alert('upvoted');
    }
  });
  return false;
};

var submit_pic_downvote = function(id){
  $.ajax({
    type: "GET",
    url: '/pictures/' + id + '/downvote.json',
    dataType: 'json',
    success: function(msg) {
      alert('downvoted');
    }
  });
  return false;
};

