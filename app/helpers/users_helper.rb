require 'digest/md5'

module UsersHelper

  def user_cover(user, type="back")
    if user
      if user.cover.url
        name = user.cover.url
      else
        index = Digest::MD5.hexdigest(user.username.to_s).to_i(16) % 4
        name = "background_#{index}.jpg"
      end
    else
      name = "background_0.jpg"
    end
    puts name

    case type
      when "name"
        name
      when "url"
        asset_path(name)
      when "back"
        "background-image: url(#{ asset_path(name)})"
      else
        name
    end
  end

  def user_avatar(user, type="name")
    puts user
    if user
      if user.avatar.url
        name = user.avatar.url
      else
        index = Digest::MD5.hexdigest(user.username.to_s).to_i(16) % 19
        name = "avatar_#{index}.jpg"
      end
    else
      name = "avatar_0.jpg"
    end
    puts name

    case type
      when "name"
        name
      when "url"
        asset_path(name)
      else
        name
    end
  end

  def following?(user)
    !current_user.friends.find_by_id(user).nil?
  end

  def follows_you?(user)
    !user.friends.find_by_id(current_user).nil?
  end

  def relative_time(created_at)
    time_ago_in_words(created_at)
  end

  def formatted_time(created_at)
    created_at.strftime("%b %d, %Y")
  end

end
