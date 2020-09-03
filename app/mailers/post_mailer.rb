class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: 'tokih4ru@gmail.com', subject: "投稿の確認メール"
  end
end
