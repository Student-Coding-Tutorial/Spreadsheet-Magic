module GitHubAlerts
  ALERT_PATTERN = /^ {0,3}>[ \t]*\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\][ \t]*\r?\n((?: {0,3}>[ \t]?.*(?:\r?\n|\z))*)/i

  def self.convert(content)
    content.gsub(ALERT_PATTERN) do
      type = Regexp.last_match(1).downcase
      body = Regexp.last_match(2).lines.map { |line| line.sub(/\A {0,3}>[ \t]?/, "") }.join
      %(<div class="markdown-alert markdown-alert-#{type}" role="note" markdown="1">\n\n**#{type.capitalize}**\n\n#{body}</div>)
    end
  end
end

Jekyll::Hooks.register :pages, :pre_render do |page, _payload|
  if %w[.md .markdown].include?(page.extname.downcase)
    page.content = GitHubAlerts.convert(page.content)
  end
end
