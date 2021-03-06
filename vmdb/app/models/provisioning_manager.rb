class ProvisioningManager < ActiveRecord::Base
  include EmsRefresh::Manager
  belongs_to :provider

  has_many :operating_system_flavors, :dependent => :destroy
  has_many :customization_scripts,    :dependent => :destroy
  has_many :customization_script_ptables
  has_many :customization_script_media

  delegate :zone, :my_zone, :zone_name, :to => :provider

  virtual_column :name,                :type => :string,      :uses => :provider
end
