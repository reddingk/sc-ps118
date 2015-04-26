class Sfile < ActiveRecord::Base
    mount_uploader :syncfile, SyncfileUploader
    validates :name, :userid, :devid, presence: true
end
