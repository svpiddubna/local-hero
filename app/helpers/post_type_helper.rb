module PostTypeHelper
  def determine_post_type(post)
    case post
    when Question
      post.becomes(Question)
    when Task
      post.becomes(Task)
    when Event
      post.becomes(Event)
    end
  end
end
