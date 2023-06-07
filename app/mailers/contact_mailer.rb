class ContactMailer < ApplicationMailer
    def picture_mail(picture)
      @@icture = picture

      mail to: @picture.email, subject: "お問い合わせの確認メール"
end
