class Comment < ActiveRecord::Base
  belongs_to :article   #关联article(注意不是articles)，评论属于article（创建model时候：article:references这个参数）
  belongs_to :user
  validates :body,:commenter, presence: true,     
                    length: { minimum: 2 } 


end
