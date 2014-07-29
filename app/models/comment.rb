class Comment < ActiveRecord::Base
	belongs_to :article
	
	validates_presence_of :name,:email,:body
	validate :aritcle_should_be_published
	
	after_create :email_article_author
	
	def aritcle_should_be_published
		errors.add(:article_id,"is not published at") if article && !article.published?
	end
	
	def email_article_author
		puts "We will notify the author #{article.user.email}!"
	end
end
