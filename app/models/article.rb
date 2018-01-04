class Article < ActiveRecord::Base
    has_many :comments  #多关联comment，可以一篇文章可以有很多评论
    
    belongs_to :user
    #验证
    
    validates :title,:text, presence: true,       #title存在
                    length: { minimum: 2 }  #最小为3个
end
