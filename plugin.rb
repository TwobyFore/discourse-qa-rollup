# name: discourse_qa_rollup
# about: highlight best post of given topic, modify topic element order
# authors: Vairix

register_asset "stylesheets/top_answer.css"

after_initialize do

  Discourse::Application.routes.prepend do
    get "highlight_post" => "posts#highlight_post"
  end

  load File.expand_path("../controllers/extended_posts_controller.rb", __FILE__)
end
