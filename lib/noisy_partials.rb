module ActionView
  module Partials
    def render_partial_with_explanation(*args) 
      partial_path = args[0][:partial]
      start_explanation = "\n<!-- START PARTIAL #{partial_path} -->\n"
      end_explanation = "\n<!-- END PARTIAL #{partial_path} -->\n"
      start_explanation + render_partial_without_explanation(*args).to_s + end_explanation
    end

    alias_method_chain :render_partial,:explanation     
  end
end
 
