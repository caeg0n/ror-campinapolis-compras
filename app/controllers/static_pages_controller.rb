class StaticPagesController < ApplicationController
  def get_privacy_policy
    id = params[:id]
    file_path = Rails.root.join('config', "privacy_policy_#{id}.txt")

    if File.exist?(file_path)
      render plain: File.read(file_path)
    else
      render plain: default_privacy_policy_text, status: :not_found
    end
  end

  def privacy_policy
    render plain: default_privacy_policy_text
  end

  private

  def default_privacy_policy_text
    File.read(Rails.root.join('config', 'privacy_policy_default.txt'))
  end
end
