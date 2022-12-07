class Mersenne < ApplicationRecord
    include ActiveModel::Serializers::Xml
    include PagesHelper


    validates :num, presence: { message: 'не может быть пустым' },
                    comparison: { greater_than: 0 }
    validates_uniqueness_of :num, :message => "already exists"
    self.primary_key = :num
end
