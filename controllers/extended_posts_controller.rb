PostsController.class_eval do

  HIGHLIGHTS_TYPES = { most_liked_post: 'most_liked_post' }

  def highlight_post
    begin
      post = Post.find(params[:post_id])
      most_liked_post = post.topic.posts.joins(user: [group_users:[:group]]).where(groups: {name: params[:group]}).order(like_count: :desc).limit(1).first
      if most_liked_post.id == post.id
        render text: HIGHLIGHTS_TYPES[:most_liked_post]
      else
        head :ok
      end
    rescue
      head :ok
    end
  end

end
