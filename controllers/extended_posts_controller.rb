PostsController.class_eval do

  HIGHLIGHTS_TYPES = { most_liked_post: 'most_liked_post' }

  def highlight_post
    begin
      post = Post.find(params[:post_id])
      most_liked_post = post.topic.posts.order('like_count desc').limit(1).first
      groups = post.user.groups.where(name: params[:group])
      if most_liked_post.id == post.id && !groups.empty?
        render text: HIGHLIGHTS_TYPES[:most_liked_post]
      else
        head :ok
      end
    rescue
      head :ok
    end
  end

end
