export default {
  name: "extend-post",

  initialize: function (container) {
    if (Discourse.Post){
      Discourse.Post.reopen({

        highlight_post: function() {
          const post_id = this.get('id');
          const username = this.get('username');
          const group = Discourse.SiteSettings.group;

          const res = $.ajax("/highlight_post", {
            type: 'GET',
            data: { post_id: post_id, group: group }
          }).done(function(res){
            if(res.highlight_post){
              $("article.boxed[data-post-id='"+ post_id +"']").addClass('most_liked_post');
            }
          });
        }.property('highlight_post')
      });
    }
  }
};

