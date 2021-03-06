# == Schema Information
#
# Table name: taggings
#
#  id            :uuid             not null, primary key
#  tag_id        :uuid
#  taggable_id   :uuid
#  taggable_type :string
#  taggable_slug :string
#  created_at    :datetime
#

class TaggingSerializer < ActiveModel::Serializer
  attributes :id, :slug, :type, :tags

  def id
    object.taggable_id
  end

  def slug
    object.taggable_slug
  end

  def type
    object.taggable_type
  end

  def tags
    Tagging.tags_by_taggable(id)
  end
end
