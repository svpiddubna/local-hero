module PostLinkHelper
  def determine_post_path(post, param=nil)
    case post
    when Question
      question_path(post, param)
    when Task
      task_path(post, param)
    when Event
      event_path(post, param)
    end
  end
end
