class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.ransackable_attributes(auth_object = nil)
    super + _ransackers.keys
  end
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment","document_attachment", "image_blob","document_blob"]
  end
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end
  end
end
