class Diary < ApplicationRecord
    validates:title,:body,presence:true
end
