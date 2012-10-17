Given /I create the following articles/ do |article_table|
  article_table.hashes.each do |article| 
    steps %Q{
      And I follow "New Article"
      And I fill in "article_title" with "#{article[:title]}"
      And I fill in "article__body_and_extended_editor" with "#{article[:body]}"
      And I press "Publish"
    }          
  end
end

Given /the following comments exist/ do |comment_table|
  comment_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end

Then /the author of "(.*)" should be "(.*)"/ do |article, author_|
  Article.find_by_title(article).author.should == author_
end

Then /"(.*)" should all comment about "(.*)"/ do |author_list, title|
  comment_authors = author_list.split(%r{,\s*})
  article = Article.find_by_title(title)
  comment_authors.each do |author|
    comment = Comment.find_by_author(author)
    comment[:article_id].should == article[:id]
  end
end
