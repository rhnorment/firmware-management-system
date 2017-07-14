ActiveAdmin.register EmailRecipient do

  menu priority: 4

  permit_params :name, :email

end
