PostsController.class_eval do

  HIGHLIGHTS_TYPES = { best_post: 'best_post', given_group: 'given_group' }

  def highlight_post
    begin
      post = Post.find(params[:post_id])
      post_most_liked = post.topic.posts.order('like_count desc').limit(1).first

      if post_most_liked.id == post.id
        users = Group.where(name: params[:group])
        if users.empty?
          render text: HIGHLIGHTS_TYPES[:best_post]
        else
          users.first.users.where(username: params[:username])
          render text: HIGHLIGHTS_TYPES[:given_group]
        end
      else
        head :ok
      end
    rescue
      head :ok
    end
  end

end
