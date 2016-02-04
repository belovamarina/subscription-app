ActiveAdmin.register User do

  config.batch_actions = true

  filter :email
  filter :created_at

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  # show :title => :email do
  #   panel "Subscription History" do
  #     table_for(user.subscription) do
  #       column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
  #       # column("State")                   {|order| status_tag(order.state) }
  #       column("Date", :sortable => :created_at){|order| pretty_format(order.created_at) }
  #       column("Total")                   {|order| number_to_currency order.order_total_price }
  #     end
  #   end
  # end

  sidebar "User Details", :only => :show do
    attributes_table_for user, :email, :created_at
  end

  # sidebar "Order History", :only => :show do
  #   attributes_table_for customer do
  #     row("Total Orders") { customer.orders.count }
  #     # row("Total Value") { number_to_currency customer.orders.sum(:order_total_price) }
  #   end
  # end


end