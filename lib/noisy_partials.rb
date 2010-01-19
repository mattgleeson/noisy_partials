module ActionView
  module Partials
    def render_partial_with_explanation(*args) 
      partial_path = args[0][:partial]
      start_explanation = "\n<!-- START PARTIAL #{partial_path} -->\n"
      end_explanation = "\n<!-- END PARTIAL #{partial_path} -->\n"
      content = render_partial_without_explanation(*args).to_s
      # ghetto html detector.  try not to put html comments into
      # non-html content or around the very beginning or end of an
      # html document.  it can break layout on at least ie6.
      if content =~ /[<>]/  && content !~ /(<\/html>|DOCTYPE)/i
        start_explanation + content + end_explanation
      else
        content
      end
    end

    alias_method_chain :render_partial,:explanation     
  end
end
 
